import "@a10n/blueprint-typespec";
import "../task-relational-store/main.tsp";
import "../../products/task-engine/features/task-lifecycle.tsp";

@component(#{ type: ComponentType.Service })
namespace Components.TaskService {
  @reads([Components.TaskRelationalStore.TaskRow])
  @writes([Components.TaskRelationalStore.TaskRow])
  @projects(
    Products.TaskEngine.Features.TaskLifecycle.task_persisted,
  )
  op create_task(title: string): { id: string };

  @reads([Components.TaskRelationalStore.TaskRow])
  @projects(
    Products.TaskEngine.Features.TaskLifecycle.task_retrievable,
  )
  op get_task(id: string): { id: string; title: string; done: boolean };

  @writes([Components.TaskRelationalStore.TaskRow])
  op update_task(id: string, done: boolean): void;
}
