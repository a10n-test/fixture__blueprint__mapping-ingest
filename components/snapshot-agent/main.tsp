import "@a10n/blueprint-typespec";
import "../blobstore-sdk/main.tsp";
import "../meta-relational-store/main.tsp";
import "../snapshot-file-store/main.tsp";
import "./graph/main.tsp";
import "./evals/classify/001_classify.tsp";

using State;
using Components.BlobstoreSdk;
using Components.MetaRelationalStore;
using Components.SnapshotFileStore;

@component(#{ type: ComponentType.Agent })
@dependsOn([Components.BlobstoreSdk, Components.MetaRelationalStore, Components.SnapshotFileStore])
@testing(Components.BlobstoreSdk, #{
  approach: TestingApproach.Mock,
  reasoning: "The blob store is an external dependency; a mock returns deterministic objects so the snapshot graph is exercised without a live store.",
})
@testing(Components.MetaRelationalStore, #{
  approach: TestingApproach.Real,
  reasoning: "Use a real in-memory store so meta rows the snapshot writes are verified end-to-end.",
})
@testing(Components.SnapshotFileStore, #{
  approach: TestingApproach.Mock,
  reasoning: "File store is mocked so classify evals don't need live blob storage.",
})
namespace Components.SnapshotAgent {}
