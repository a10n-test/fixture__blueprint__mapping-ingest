import "@a10n/blueprint-typespec";
import "../../task-relational-store/main.tsp";
import "../../../products/task-engine/features/task-lifecycle.tsp";

using State;

namespace Components.TaskService.Commands {
  // create_task DECLARES it calls get_task. The impl seed (CreateTask) does NOT
  // reach a get_task-marked symbol through its native call graph -> a BROKEN link
  // (spec_call_without_impl_marker). The impl DOES natively reach a symbol marked
  // update_task, which create_task does not declare -> an ORPHAN branch
  // (impl_marker_not_in_spec).
  @calls([get_task])
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
