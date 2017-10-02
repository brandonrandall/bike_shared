require 'csv'
require './app/models/station.rb'
require './app/models/trip.rb'
require 'pry'
require 'Date'

CSV.foreach('db/csv/bike_stations.csv', headers: true) do |row|
  Station.create!({
    name: row["name"],
    dock_count: row["dock_count"],
    city: row["city"],
    installation_date: DateTime.strptime(row["installation_date"], "%m/%d/%Y")})
end

CSV.foreach('db/csv/trip.csv', headers: true) do |row|
  Trip.create({
  duration: row["duration"],
  start_date: row["start_date"].split(' ').first,
  start_station: row["start_station_name"],
  end_date: row["end_date"].split(' ').first,
  end_station: row["end_station_name"],
  bike_id: row["bike_id"],
  subscription_type: row["subscription_type"],
  zip_code: ("00000" if row["zip_code"] == nil)})
end
