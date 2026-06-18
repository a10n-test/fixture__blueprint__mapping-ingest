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

  // AuditRow is a declared store model. The impl reaches a symbol marked
  // AuditRow from create_task's call graph, but create_task does NOT declare a
  // @reads/@writes on AuditRow -> the marker is an ORPHAN branch from the spec's
  // perspective (impl_marker_not_in_spec). AuditRow also has neither a spec
  // @reads nor @writes edge anywhere, so it is an unstitched store-no-reader /
  // store-no-writer island.
  @TypeSpec.Dbml.table(#{ name: "audit" })
  model AuditRow {
    id: string;
    action: string;
  }
}
