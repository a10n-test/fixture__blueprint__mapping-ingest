import "@a10n/blueprint-typespec";
import "./components/acme-sdk/main.tsp";

using State;

@doc("Acme client library used to fetch reference data during task creation.")
@dependency(#{
  title: "Acme",
  type: DependencyType.Library,
  status: DependencyStatus.Active,
  sources: #[
    #{
      url: "https://github.com/acme/acme-sdk",
      description: "SDK-specific integration patterns and call signatures",
    },
  ],
  why: #[
    "Typed client we vendor instead of hand-rolling Acme calls",
  ],
  how: #[
    "Invoke the SDK fetch operation when a task needs reference data",
  ],
})
namespace Dependencies.Acme { }
