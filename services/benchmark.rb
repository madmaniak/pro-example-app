class Front::Services::Benchmark < Service

  def perform(data)
    sleep(1)
    reply data, data: { event: "benchmarked!" }
  end

end
