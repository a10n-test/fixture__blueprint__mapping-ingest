import "@a10n/blueprint-typespec";
import "../events/main.tsp";
import "../../task-relational-store/main.tsp";

using State;
using Components.TaskService.Events;

@worker
namespace Components.TaskService.Workers.TaskCreatedWorker {
  @doc("Handles TaskEvents.created by indexing the new task.")
  @subscribes
  @reads([Components.TaskRelationalStore.TaskRow])
  op handle(input: TaskEvents): void;
}
