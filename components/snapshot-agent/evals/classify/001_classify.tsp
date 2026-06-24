import "@a10n/blueprint-typespec";
import "../../main.tsp";
import "../../graph/main.tsp";
import "../../datasets/classify/001_classify_samples.tsp";

using State;

namespace Components.SnapshotAgent.Evals.Classify;

@doc("Eval suite covering the classify predict op.")
@evalSuite(#{
  title: "Classify Quality",
  priority: Priority.Must,
  expects: #[],
})
@calls([
  Components.SnapshotAgent.Graph.classify,
  Components.SnapshotAgent.d001_classify_samples,
])
op E001(inputs: E001Inputs): void;

model E001Inputs {}
