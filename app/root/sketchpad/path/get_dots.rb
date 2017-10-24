Getter __FILE__ do

  setup \
    base: :dots,
    fields: [:x, :y],
    order: [ [field('i').cast(:int)] ],
    limit: false

end
