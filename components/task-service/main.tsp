import "@a10n/blueprint-typespec";
import "../task-relational-store/main.tsp";
import "./commands/main.tsp";
import "../../dependencies/github/main.tsp";
import "../../dependencies/acme/main.tsp";

using State;

@testing(
  Components.TaskRelationalStore,
  #{ approach: TestingApproach.Real, reasoning: "Exercise the real store so task persistence and retrieval are covered end-to-end." }
)
@testing(Dependencies.Github.Components.ApiService, #{
  approach: TestingApproach.Mock,
  reasoning: "Mock the GitHub API service so task creation tests stay hermetic and avoid network and rate-limit flakiness.",
})
@testing(Dependencies.Acme.Components.AcmeSdk, #{
  approach: TestingApproach.Mock,
  reasoning: "Mock the Acme SDK so task creation tests do not exercise the third-party client.",
})
@component(#{ type: ComponentType.Service })
namespace Components.TaskService {}
