require_relative './app/app'

run ->(env) {
  Resque.enqueue(Index::IndexJob)
  [200, {"Content-Type" => "text/html"}, ["Hello   World 2!"]]
}