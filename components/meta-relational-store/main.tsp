import "@a10n/blueprint-typespec";
import "@a10n/typespec-dbml";

using State;

@component(#{ type: ComponentType.Store })
namespace Components.MetaRelationalStore {
  @TypeSpec.Dbml.table(#{ name: "meta" })
  model MetaRow {
    id: string;
    payload: string;
  }
}
