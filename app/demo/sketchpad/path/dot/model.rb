class Dot < Sequel::Model
  immutable true
  many_to_one :path
end
