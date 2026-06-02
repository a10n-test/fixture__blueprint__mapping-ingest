import "@a10n/blueprint-typespec";
import "../../task-relational-store/main.tsp";
import "../../../products/task-engine/features/task-lifecycle.tsp";
import "../../index-sdk/operations/main.tsp";

using State;

namespace Components.TaskService.Commands {
  // create_task is the SHALLOW CONSUMER. It starts with NO edges so the ingest
  // rewrite is observable. After ingest it carries only the edges it is itself
  // accountable for: its own store write, a call to the SDK op it invokes
  // (sync_index), and the invariants it plus the op-less auditLog helper realize
  // (task_persisted and audit_recorded). The realizing op sync_index keeps its
  // own store-read, event publish, and index_synced invariant — they do not leak
  // up here. (Decorator tokens are intentionally omitted from this comment so the
  // e2e block assertions can scan the rendered decorators without false hits.)
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
