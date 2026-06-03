import "@a10n/blueprint-typespec";
import "../../report-relational-store/main.tsp";

using State;

namespace Components.ReportService.Commands {
  // report_run reads ReportRow directly (first-on-path) and reaches ConfigRow /
  // ManifestRow through the op-less loadConfig → loadManifest chain in the impl.
  // ingest writes the @reads edges from the impl markers; the rwc strip drops
  // ManifestRow (redundant-behind ConfigRow's store marker).
  @operation(#{})
  op report_run(id: string): void;
}
