import "@a10n/blueprint-typespec";
import "./http/main.tsp";

using State;

@doc("GitHub REST API service component — exposed for cross-dependency call targeting.")
@component(#{ type: ComponentType.Service })
namespace Dependencies.Github.Components.ApiService { }
