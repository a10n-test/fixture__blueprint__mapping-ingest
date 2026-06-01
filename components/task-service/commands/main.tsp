import "@a10n/blueprint-typespec";
import "../../task-relational-store/main.tsp";
import "../../../products/task-engine/features/task-lifecycle.tsp";

using State;

namespace Components.TaskService.Commands {
  @reads([Components.TaskRelationalStore.TaskRow])
  @writes([Components.TaskRelationalStore.TaskRow])
  @projects(
    Products.TaskEngine.Features.TaskLifecycle.task_persisted,
  )
  @operation(#{})
  op create_task(title: string): { id: string };

  @reads([Components.TaskRelationalStore.TaskRow])
  @projects(
    Products.TaskEngine.Features.TaskLifecycle.task_retrievable,
  )
  @operation(#{})
  op get_task(id: string): { id: string; title: string; done: boolean };

  @reads([Components.TaskRelationalStore.TaskRow])
  @writes([Components.TaskRelationalStore.TaskRow])
  @operation(#{})
  op update_task(id: string, done: boolean): void;
}
