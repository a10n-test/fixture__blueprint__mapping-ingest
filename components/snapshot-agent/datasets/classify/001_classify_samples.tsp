import "@a10n/blueprint-typespec";
import "../../main.tsp";
import "../../../../products/task-engine/features/task-lifecycle.tsp";
import "../../../../components/snapshot-file-store/main.tsp";

using State;

namespace Components.SnapshotAgent;

@doc("Representative snapshot object samples used by the classify eval suite.")
@dataset(#{ title: "Classify samples" })
@reads([Components.SnapshotFileStore.SnapshotObject])
@projects(Products.TaskEngine.Features.TaskLifecycle.task_persisted)
op d001_classify_samples(): void;
