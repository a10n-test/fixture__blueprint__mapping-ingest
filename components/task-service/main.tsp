import "@a10n/blueprint-typespec";
import "../task-relational-store/main.tsp";
import "../../products/task-engine/features/task-lifecycle.tsp";

@component(#{ type: ComponentType.Service })
namespace Components.TaskService {
  @reads([Components.TaskRelationalStore.TaskRow])
  @writes([Components.TaskRelationalStore.TaskRow])
  @testing(#{
    approach: TestingApproach.Real,
    reasoning: "Store writes are exercised directly — no mock needed.",
  })
  @doc("Create a new task and persist it.")
  #suppress "@a10n/blueprint-typespec/op-invariant-cap" "single op covers multiple lifecycle invariants"
  @projects(
    Products.TaskEngine.Features.TaskLifecycle.task_persisted,
  )
  op create_task(title: string): { id: string };

  @projects(
    Products.TaskEngine.Features.TaskLifecycle.task_retrievable,
  )
  op get_task(id: string): { id: string; title: string; done: boolean };

  op update_task(id: string, done: boolean): void;
}
