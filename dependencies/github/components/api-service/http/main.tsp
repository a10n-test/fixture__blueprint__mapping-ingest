import "@a10n/blueprint-typespec";
import "@typespec/http";

using State;
using Http;

namespace Dependencies.Github.Components.ApiService.Http {
  @get
  op get_repo(): void;
}
