import "@a10n/blueprint-typespec";
import "@a10n/typespec-dbml";

using State;

@component(#{ type: ComponentType.Store })
namespace Components.OtherRelationalStore {
  @TypeSpec.Dbml.table(#{ name: "other" })
  model OtherRow {
    id: string;
    payload: string;
  }
}
