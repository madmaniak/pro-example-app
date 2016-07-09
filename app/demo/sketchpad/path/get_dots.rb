Getter __FILE__ do

  setup \
    base: :dots,
    scope: ->(ds, params) { ds.order(:id) },
    fields: [:x, :y]

end
