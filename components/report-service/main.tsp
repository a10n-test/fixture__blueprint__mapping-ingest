import "@a10n/blueprint-typespec";
import "../report-relational-store/main.tsp";
import "./commands/main.tsp";

using State;

@testing(
  Components.ReportRelationalStore,
  #{ approach: TestingApproach.Real, reasoning: "report_run reads directly from the store; use the real store to verify reads are correct." }
)
@component(#{ type: ComponentType.Service })
namespace Components.ReportService {}
