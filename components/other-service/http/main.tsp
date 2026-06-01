import "@a10n/blueprint-typespec";
import "@typespec/http";
import "../../other-relational-store/main.tsp";

using State;
using TypeSpec.Http;

namespace Components.OtherService.Http {
  @get
  @reads([Components.OtherRelationalStore.OtherRow])
  op fetch(): void;
}
