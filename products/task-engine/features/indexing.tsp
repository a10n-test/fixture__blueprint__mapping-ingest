import "@a10n/blueprint-typespec";
using State;

@feature
namespace Products.TaskEngine.Features.Indexing {
  @invariant(#{ predicate: "A created task is synced into the search index.", why: "Search freshness." })
  op index_synced(): void;
}
