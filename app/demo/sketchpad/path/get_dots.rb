module Front::App::Demo
  module Sketchpad
    module Path
      class GetDots < Getter
        setup \
          base: :dots,
          scope: ->(ds, params) { ds.order(:id) },
          fields: [:x, :y]
      end
    end
  end
end
