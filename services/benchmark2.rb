class Front::Services::Benchmark2 < Service

  def perform(data)
    reply data, data: { event: "benchmarked!" }
  end

end
