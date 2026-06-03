import "@a10n/blueprint-typespec";
import "../meta-relational-store/main.tsp";
import "./operations/main.tsp";

using State;

@component(#{ type: ComponentType.Sdk })
namespace Components.BlobstoreSdk {}
