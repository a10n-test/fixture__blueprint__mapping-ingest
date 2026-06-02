import "@a10n/blueprint-typespec";
import "../task-relational-store/main.tsp";
import "./operations/main.tsp";
import "./events/main.tsp";

using State;

@component(#{ type: ComponentType.Sdk })
@testing(
  Components.TaskRelationalStore,
  #{ approach: TestingApproach.Real, reasoning: "Index sync reads the real store row so the synced payload is verified end-to-end." }
)
namespace Components.IndexSdk {}
