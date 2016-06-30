class Path < Sequel::Model
  immutable true
  one_to_many :dots
end
