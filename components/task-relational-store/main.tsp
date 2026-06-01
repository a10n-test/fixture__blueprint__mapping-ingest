import "@a10n/blueprint-typespec";

using State;

@component(#{ type: ComponentType.Store })
namespace Components.TaskRelationalStore {
  model TaskRow {
    id: string;
    title: string;
    done: boolean;
  }
}
