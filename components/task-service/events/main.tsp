import "@a10n/blueprint-typespec";
import "@typespec/events";

using State;
using TypeSpec.Events;

namespace Components.TaskService.Events;

model TaskCreated {
  id: string;
}

@events
union TaskEvents {
  created: TaskCreated,
}
