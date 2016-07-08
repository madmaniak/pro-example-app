module Front::App::Questions
  class Get < Getter
    setup \
      base: :questions,
      fields: [:value, :votes]
  end
end
