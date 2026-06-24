import "@a10n/blueprint-typespec";
import "../../index-sdk/events/main.tsp";
import "../../task-relational-store/main.tsp";

using State;
using Components.IndexSdk.Events;

@worker
namespace Components.TaskService.Workers.IndexSyncWorker {
  @doc("Handles \\{@IndexEvents.synced} by refreshing the task search cache.")
  @subscribes
  @reads([Components.TaskRelationalStore.TaskRow])
  op handle(input: IndexEvents): void;
}
