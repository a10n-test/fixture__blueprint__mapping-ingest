import "@a10n/blueprint-typespec";
import "../../index-sdk/events/main.tsp";
import "../../task-relational-store/main.tsp";

using State;
using Components.IndexSdk.Events;

namespace Components.TaskService;

@worker
namespace IndexSyncWorker {
  @doc("Handles IndexEvents.synced by refreshing the task search cache.")
  @subscribes
  @reads([Components.TaskRelationalStore.TaskRow])
  op handle(input: IndexEvents.synced): void;
}
