Service __FILE__ do

  def perform(data)
    reply data, data: { event: "benchmarked!" }
  end

end
