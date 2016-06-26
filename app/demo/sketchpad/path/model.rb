class Path < Sequel::Model
  one_to_many :dots
end
