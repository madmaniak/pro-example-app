module Front::App::Questions
  class Get < Service

    def perform(data)
      send_data(data['sid'], :questions) { |collection| collection.all }
    end

  end
end
