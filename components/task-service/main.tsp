import "@a10n/blueprint-typespec";
import "../task-relational-store/main.tsp";

using State;

@component(#{ type: ComponentType.Service })
namespace Components.TaskService {
  @reads([Components.TaskRelationalStore.TaskRow])
  @writes([Components.TaskRelationalStore.TaskRow])
  @operation(#{})
  op create_task(title: string): { id: string };

  @operation(#{})
  op get_task(id: string): { id: string; title: string; done: boolean };

  @operation(#{})
  op update_task(id: string, done: boolean): void;
}
