import "@a10n/blueprint-typespec";
import "../../task-relational-store/main.tsp";
import "../../../products/task-engine/features/indexing.tsp";
import "../events/main.tsp";

using State;

namespace Components.IndexSdk.Operations {
  // sync_index is the REALIZING op. It starts with NO edges so the ingest
  // rewrite is observable: after ingest it carries its own store read, the
  // index_synced invariant it projects, and the event it publishes — and none of
  // those leak up to the create_task consumer that invokes it. (Decorator tokens
  // omitted from this comment so the e2e Contains assertions match the rendered
  // decorators, not this prose.)
  @operation(#{})
  op sync_index(id: string): void;
}
