module Front::App::Questions
  class Add < Service

    def perform(data)
      id = $db[:questions].insert value: data['value']
      reply sid: :all, data: {
        questions: { id => { id: id, value: data['value'], votes: 0 } }
      }
    end

  end
end
