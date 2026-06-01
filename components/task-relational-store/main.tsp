import "@a10n/blueprint-typespec";

@component(#{ type: ComponentType.Store })
namespace Components.TaskRelationalStore {
  model TaskRow {
    id: string;
    title: string;
    done: boolean;
  }
}
