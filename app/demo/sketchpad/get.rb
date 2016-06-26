module Front::App::Demo
  module Sketchpad
    class Get < Service

      def perform(data)
        send_data(data['sid'], :paths) { |collection| collection.all }
        send_data(data['sid'], :dots)  { |collection| collection.all }
      end

    end
  end
end
