class Front::Services::Benchmark2 < Service

  def perform(data)
    reply sid: data['sid'], data: "benchmarked!"
  end

end
