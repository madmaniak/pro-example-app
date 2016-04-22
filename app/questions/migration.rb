require 'rubygems'
require 'sequel'

db = Sequel.sqlite('app.db')

db.create_table :questions do
  primary_key :id
  String :value
  Integer :votes, default: 0
end
