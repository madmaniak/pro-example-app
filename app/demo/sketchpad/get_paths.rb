module Front::App::Demo
  module Sketchpad
    class GetPaths < Getter
      setup \
        base: :paths,
        relations: { dots: Sketchpad::Path::GetDots }
    end
  end
end
