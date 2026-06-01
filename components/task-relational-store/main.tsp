import "@a10n/blueprint-typespec";
import "@a10n/typespec-dbml";

using State;

@component(#{ type: ComponentType.Store })
namespace Components.TaskRelationalStore {
  @TypeSpec.Dbml.table(#{ name: "task" })
  model TaskRow {
    id: string;
    title: string;
    done: boolean;
  }
}
