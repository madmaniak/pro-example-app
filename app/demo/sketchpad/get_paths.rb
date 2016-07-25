Getter __FILE__ do

  setup \
    base: :paths,
    relations: { dots: NS.take(__FILE__)::Path::GetDots }

end
