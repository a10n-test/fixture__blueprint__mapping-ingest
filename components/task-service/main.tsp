import "@a10n/blueprint-typespec";
import "../task-relational-store/main.tsp";
import "./commands/main.tsp";
import "./http/main.tsp";

using State;

@component(#{ type: ComponentType.Service })
namespace Components.TaskService {}
