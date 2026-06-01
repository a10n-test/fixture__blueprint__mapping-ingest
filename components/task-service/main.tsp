import "@a10n/blueprint-typespec";
import "../task-relational-store/main.tsp";
import "../../products/task-engine/features/task-lifecycle.tsp";

using State;

@component(#{ type: ComponentType.Service })
namespace Components.TaskService {
  @calls([get_task])
  @operation(#{})
  @projects(
    Products.TaskEngine.Features.TaskLifecycle.task_persisted,
  )
  op create_task(title: string): { id: string };

  @operation(#{})
  @projects(
    Products.TaskEngine.Features.TaskLifecycle.task_retrievable,
  )
  op get_task(id: string): { id: string; title: string; done: boolean };

  op update_task(id: string, done: boolean): void;
}
