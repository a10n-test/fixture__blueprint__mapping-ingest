import "@a10n/blueprint-typespec";
import "./components/api-service/main.tsp";

using State;

@doc("GitHub provides repository read access used to fetch repo metadata during task creation.")
@dependency(#{
  title: "GitHub",
  type: DependencyType.Service,
  status: DependencyStatus.Active,
  sources: #[
    #{
      url: "https://github.com/github/rest-api-description",
      description: "REST API endpoint shapes when the published docs are ambiguous",
    },
  ],
  why: #[
    "Authoritative source of repository metadata referenced by tasks",
  ],
  how: #[
    "Call the repository read endpoint when a task is created against a repo",
  ],
})
@assumption(#{ id: "A01", assumption: "REST API endpoints stable with 5000 req/hour rate limit per token", source: "https://docs.github.com/en/rest/overview/rate-limits-for-the-rest-api" })
namespace Dependencies.Github { }
