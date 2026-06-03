import "@a10n/blueprint-typespec";
import "@a10n/typespec-dbml";

using State;

@component(#{ type: ComponentType.Store })
namespace Components.ReportRelationalStore {
  @TypeSpec.Dbml.table(#{ name: "report" })
  model ReportRow {
    id: string;
  }

  @TypeSpec.Dbml.table(#{ name: "config" })
  model ConfigRow {
    key: string;
  }

  @TypeSpec.Dbml.table(#{ name: "manifest" })
  model ManifestRow {
    name: string;
  }
}
