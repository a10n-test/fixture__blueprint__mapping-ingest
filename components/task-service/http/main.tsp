import "@a10n/blueprint-typespec";
import "@typespec/http";

using State;
using TypeSpec.Http;

namespace Components.TaskService.Http {
  @get
  op ping(): void;
}
