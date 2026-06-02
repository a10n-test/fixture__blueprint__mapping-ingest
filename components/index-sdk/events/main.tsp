import "@a10n/blueprint-typespec";
import "@typespec/events";

using State;
using TypeSpec.Events;

namespace Components.IndexSdk.Events;

model TaskSynced {
  id: string;
}

@doc("Events emitted by the index SDK as it syncs tasks.")
@events
union IndexEvents {
  @doc("Emitted when a task has been synced into the search index.")
  synced: TaskSynced,
}
