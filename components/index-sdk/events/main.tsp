import "@a10n/blueprint-typespec";
import "@typespec/events";

using State;
using TypeSpec.Events;

#suppress "@a10n/blueprint-typespec/namespace-path" "test fixture: IndexSdk publishes events; real SDKs that emit events would be restructured as services"
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
