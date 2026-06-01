import "@a10n/blueprint-typespec";
import "../task-relational-store/main.tsp";
import "./commands/main.tsp";

using State;

@testing(
  Components.TaskRelationalStore,
  #{ approach: TestingApproach.Real, reasoning: "Exercise the real store so persistence and retrieval are covered end-to-end." }
)
@component(#{ type: ComponentType.Service })
namespace Components.TaskService {}
