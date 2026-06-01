import "@a10n/blueprint-typespec";
import "../../task-relational-store/main.tsp";

using State;

namespace Components.TaskService.Commands;

@operation(#{})
op create_task(title: string): { id: string };

@operation(#{})
op get_task(id: string): { id: string; title: string; done: boolean };

@operation(#{})
op update_task(id: string, done: boolean): void;
