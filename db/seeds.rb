require 'csv'
require '/.app/models/station.rb'

CSV.foreach('db/csv/bike_stations.csv', headers: true) do |row|
  Station.create!({
    name: row["name"],
    dock_count: row["dock_count"],
    city: row["city"],
    installation_date: row["installation_date"]})
end
