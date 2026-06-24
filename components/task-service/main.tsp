import "@a10n/blueprint-typespec";
import "../task-relational-store/main.tsp";
import "../index-sdk/main.tsp";
import "./commands/main.tsp";
import "./workers/index-sync-worker.tsp";

using State;

@testing(
  Components.TaskRelationalStore,
  #{ approach: TestingApproach.Real, reasoning: "Exercise the real store so task persistence and retrieval are covered end-to-end." }
)
@testing(
  Components.IndexSdk,
  #{ approach: TestingApproach.Mock, reasoning: "Mock the index SDK so ingestion tests don't require a real search backend." }
)
@dependsOn([Components.IndexSdk])
@component(#{ type: ComponentType.Service })
namespace Components.TaskService {}
