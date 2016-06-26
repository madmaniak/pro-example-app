class Dot < Sequel::Model
  many_to_one :path
end
