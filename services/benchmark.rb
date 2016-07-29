Service __FILE__ do

  def perform(data)
    sleep(1)
    reply data, data: { event: "benchmarked!" }
  end

end
