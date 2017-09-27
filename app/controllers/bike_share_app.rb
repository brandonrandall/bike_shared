require 'will_paginate'
require 'will_paginate/active_record'
require 'pry'

class BikeShareApp < Sinatra::Base

  get '/stations' do
    @stations = Station.all
    @stations_count = Station.all.count
    erb :"/stations/index"
  end

  get '/stations/new' do
    @station = Station.new
    erb :"/stations/new"
  end

  post '/stations' do
    @station = Station.create(params[:station])
    redirect "/stations/#{@station.id}"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"/stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"/stations/edit"
  end

  put '/stations/:id' do
    station = Station.update(params[:id], params[:station])
    redirect "/stations/#{station.id}"
  end

  delete '/stations/:id' do
    @station = Station.destroy(params[:id])
    redirect "/stations"
  end

  get '/stations-dashboard' do
    @stations = Station.all
    @average_per_dock = Station.average_per_dock
    @most_bikes_at_a_station = Station.most_bikes_at_a_station
    @fewest_bikes_at_a_station = Station.fewest_bikes_at_a_station
    @stations_with_most_bikes = Station.stations_with_most_bikes
    @stations_with_fewest_bikes = Station.stations_with_fewest_bikes
    @station_with_most_recent_installation = Station.station_with_most_recent_installation
    @station_with_first_installation = Station.station_with_first_installation
    erb :"/stations/dashboard"
  end

  get '/trips' do
    @trips = Trip.all
    @trip_count = Trip.all.count
    binding.pry
    erb :"/trips/index"
  end

end
