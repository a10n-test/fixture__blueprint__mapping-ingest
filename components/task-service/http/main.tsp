import "@a10n/blueprint-typespec";
import "@typespec/http";
import "../../task-relational-store/main.tsp";

using State;
using TypeSpec.Http;

namespace Components.TaskService.Http {
  @get
  @reads([Components.TaskRelationalStore.TaskRow])
  op ping(): void;
}
