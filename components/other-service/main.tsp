import "@a10n/blueprint-typespec";
import "../other-relational-store/main.tsp";
import "./http/main.tsp";

using State;

@testing(
  Components.OtherRelationalStore,
  #{ approach: TestingApproach.Real, reasoning: "Exercise the real other store so the boundary op's read is covered." }
)
@component(#{ type: ComponentType.Service })
namespace Components.OtherService {}
