import "@a10n/blueprint-typespec";
import "../report-relational-store/main.tsp";
import "./commands/main.tsp";

using State;

@component(#{ type: ComponentType.Service })
namespace Components.ReportService {}
