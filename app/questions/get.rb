Getter __FILE__ do

  setup \
    base: :questions,
    scope: ->(ds, params) { ds.reverse(field('votes'), :id).limit(5) },
    fields: [:value, :votes]

end
