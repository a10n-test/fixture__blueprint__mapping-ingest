import "@a10n/blueprint-typespec";

using State;

@doc("File-store component that owns snapshot objects for the SnapshotAgent.")
@component(#{
  type: ComponentType.Store,
})
@storage(#{ provider: StorageProvider.filesystem, root: ".snapshots" })
namespace Components.SnapshotFileStore {

  @doc("Path model for a named snapshot object.")
  model SnapshotPath {
    @doc("Snapshot key, e.g. a task ID") key: string;
  }

  @doc("Body of a snapshot object.")
  @mediaTypeHint("application/json")
  @storageObject(#{ path: "{@SnapshotPath.key}.json" })
  model SnapshotObject {
    @doc("Serialized snapshot payload") payload: string;
  }
}
