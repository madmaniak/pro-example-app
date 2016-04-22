module Front::App::Questions
  class Get < Service

    def perform(data)
      reply sid: data['sid'], data: {
        questions: $db[:questions].all.inject({}){ |h,q| h[q[:id]] = q; h }
      }.to_json
    end

  end
end
