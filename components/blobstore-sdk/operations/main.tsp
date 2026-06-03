import "@a10n/blueprint-typespec";
import "../../meta-relational-store/main.tsp";

using State;

namespace Components.BlobstoreSdk.Operations {
  // list_objects is reached FIRST-ON-PATH from the agent entry walk (the entry
  // calls it directly, before any intervening store marker), so it is in the
  // check's `got` for the entry. A non-entry graph node hand-authors a @calls to
  // it; aggregated onto the entry it is BOTH in want and in got → no gap → the
  // node edge is KEPT (the negative case: no over-strip).
  @operation(#{})
  op list_objects(prefix: string): void;

  // read_object is reached only BEHIND MetaRelationalStore.MetaRow:writes on the entry's
  // impl walk (the entry writes meta first, then a deeper helper reads the blob),
  // so it is in the entry's walk_boundary `boundaryGot` but NOT first-on-path
  // `got`. A non-entry graph node hand-authors a @calls to it; aggregated onto the
  // entry the check flags spec_redundant_marker_behind. ingest must STRIP that
  // edge from the node (the positive case).
  @operation(#{})
  op read_object(key: string): void;

  // archive_object has NO impl at all (no marker, never AST-reached), so it is
  // absent from BOTH the entry's `got` and `boundaryGot`. A non-entry graph node
  // hand-authors a @calls to it; the strip must NOT touch it and must not crash on
  // an unreachable target (the boundary case). It stays a spec_call_without_impl_
  // marker the author resolves separately — never wrongly stripped as redundant.
  @operation(#{})
  op archive_object(key: string): void;
}
