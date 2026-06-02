import "@a10n/blueprint-typespec";
using State;

@feature
namespace Products.TaskEngine.Features.TaskLifecycle {
  @invariant(#{ predicate: "A task is persisted to the store when created.", why: "Data durability." })
  op task_persisted(): void;

  @invariant(#{ predicate: "A task can be retrieved by ID.", why: "Read correctness." })
  op task_retrievable(): void;

  @invariant(#{ predicate: "An audit entry is recorded for each created task.", why: "Traceability." })
  op audit_recorded(): void;
}
