import "@a10n/blueprint-typespec";
import "../../task-relational-store/main.tsp";
import "../../../products/task-engine/features/task-lifecycle.tsp";

using State;

namespace Components.TaskService.Commands {
  @doc("Create a task, persisting it to the relational store.")
  @writes([Components.TaskRelationalStore.TaskRow])
  @projects(Products.TaskEngine.Features.TaskLifecycle.task_persisted)
  @operation(#{})
  op create_task(title: string): { id: string };

  @doc("Retrieve a previously persisted task by its identifier.")
  @reads([Components.TaskRelationalStore.TaskRow])
  @projects(Products.TaskEngine.Features.TaskLifecycle.task_retrievable)
  @operation(#{})
  op get_task(id: string): { id: string; title: string; done: boolean };

  @doc("Update the done flag of an existing task.")
  @reads([Components.TaskRelationalStore.TaskRow])
  @writes([Components.TaskRelationalStore.TaskRow])
  @operation(#{})
  op update_task(id: string, done: boolean): void;
}
