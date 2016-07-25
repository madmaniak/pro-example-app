Getter __FILE__ do

  setup \
    base: :questions,
    fields: [:value, :votes],
    order: [ [field('votes').cast(:int), true], [:id, true] ],
    limit: 5

end
