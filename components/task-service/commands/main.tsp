import "@a10n/blueprint-typespec";
import "../../task-relational-store/main.tsp";
import "./extra.tsp";

using State;

namespace Components.TaskService.Commands {
  @operation(#{})
  op create_task(title: string): { id: string };
}
