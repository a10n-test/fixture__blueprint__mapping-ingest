import "@a10n/blueprint-typespec";
import "./operations/main.tsp";

using State;

@doc("Acme client SDK component — exposed for cross-dependency call targeting.")
@component(#{ type: ComponentType.Sdk })
namespace Dependencies.Acme.Components.AcmeSdk { }
