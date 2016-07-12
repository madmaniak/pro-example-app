Getter __FILE__ do

  setup \
    base: :paths,
    relations: [ NS.take(__FILE__)::Path::GetDots ]

end
