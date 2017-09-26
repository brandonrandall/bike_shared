require 'csv'
require './app/models/station.rb'
require 'pry'
require 'Date'

CSV.foreach('db/csv/bike_stations.csv', :headers => true) do |row|
  Station.create!({
    name: row["name"],
    dock_count: row["dock_count"],
    city: row["city"],
    installation_date: DateTime.strptime(row["installation_date"], "%m/%d/%Y")})
end
