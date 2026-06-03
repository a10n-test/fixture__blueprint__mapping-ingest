import "@a10n/blueprint-typespec";
import "../../blobstore-sdk/operations/main.tsp";
import "../../meta-relational-store/main.tsp";

using State;
using Components.BlobstoreSdk;

namespace Components.SnapshotAgent;

@graph
namespace Graph {
  model State {
    key: string;
  }

  model Classification {
    label: string;
  }

  // The is_entrypoint node. Its impl (SnapshotAgent.Run) is the agent unit's
  // ownership-marked seed: it lists objects first (list_objects is first-on-
  // path), writes MetaRelationalStore.MetaRow, then reaches read_object only BEHIND that
  // store write. ingest writes the entry's own first-on-path edges here; it must
  // NOT author read_object on the entry either (it is redundant-behind for the
  // entry too). Starts edge-free so the ingest rewrite is observable.
  @node(#{ is_entrypoint: true })
  op start(state: Graph.State): Command<{}, End>;

  // snapshot is a NON-ENTRY plain @node with NO impl ownership marker — it is
  // not an ingest seed, so its hand-authored @calls were historically preserved
  // byte-for-byte and never passed through the redundant-behind strip. The check
  // AGGREGATES these three callees onto the entry node (start) and checks only
  // the entry:
  //   - read_object  → reached only BEHIND MetaRelationalStore.MetaRow:writes → redundant-
  //                    behind on the aggregated entry → MUST be STRIPPED.
  //   - list_objects → reached first-on-path on the entry walk → in `got` → KEPT.
  //   - archive_object → no impl, never AST-reached → not in boundaryGot → KEPT
  //                    (no over-strip, no crash).
  @node
  @calls([
    Components.BlobstoreSdk.Operations.read_object,
    Components.BlobstoreSdk.Operations.list_objects,
    Components.BlobstoreSdk.Operations.archive_object,
  ])
  op snapshot(state: Graph.State): Command<{}, End>;

  // classify is the agent's @predict model boundary (one is required per graph).
  @predict op classify(key: string): Graph.Classification;
}
