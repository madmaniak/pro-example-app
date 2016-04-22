module Front::App::Questions
  module Question
    class Voteup < Service

      def perform(data)
        $db[:questions].where(id: data['id']).update(votes: Sequel.+(:votes, 1))
        reply sid: :all, data: { event: 'voteup', id: data['id'] }
      end

    end
  end
end
