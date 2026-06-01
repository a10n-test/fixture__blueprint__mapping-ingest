import "@a10n/blueprint-typespec";
import "typespec-mcp";

using State;
using MCP;

@mcpServer(#{
  name: "task-service-mcp",
  version: "1.0.0",
  instructions: "MCP server exposing task notification tools.",
})
namespace Components.TaskService.Mcp {
  @doc("Notify subscribers that task state changed.")
  @MCP.tool
  op notify(): void;
}
