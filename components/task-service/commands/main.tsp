import "@a10n/blueprint-typespec";
import "../../task-relational-store/main.tsp";
import "../../../products/task-engine/features/task-lifecycle.tsp";
import "./extra.tsp";

using State;

namespace Components.TaskService.Commands {
  @writes([Components.TaskRelationalStore.TaskRow])
  @projects(Products.TaskEngine.Features.TaskLifecycle.task_persisted)
  @operation(#{})
  op create_task(title: string): { id: string };
}
