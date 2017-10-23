require 'will_paginate'
require 'will_paginate/active_record'
require 'rubygems'

class BikeShareApp < Sinatra::Base

  include WillPaginate::Sinatra::Helpers

  get '/' do
    erb :"/welcome/index"
  end

  get '/stations' do
    # @stations = Station.all
    @stations = Station.paginate(:page => params[:page], per_page: 10)
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
    @station_with_oldest_installation = Station.station_with_oldest_installation
    erb :"/stations/dashboard"
  end

  get '/trips' do
    @most_trips_for_a_day = Trip.most_trips_for_a_day
    # @trips = Trip.order("installation_date").page(params[:page]).per_page(30)
    @trips = Trip.paginate(:page => params[:page], per_page: 30)
    @trip_count = Trip.all.count
    @number_of_rides_for_each_month = Trip.number_of_rides_for_each_month
    erb :"/trips/index"
  end

  get '/trips/new' do
    @trip = Trip.create(params[:trip])
    erb :"/trips/new"
  end

  post '/trips' do
    @trip = Trip.create(params[:trip])
    redirect "/trips/#{@trip.id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :"/trips/show"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :"/trips/edit"
  end

  put '/trips/:id' do
    trip = Trip.update(params[:id], params[:trip])
    redirect "/trips/#{trip.id}"
  end

  delete '/trips/:id' do
    @trip = Trip.destroy(params[:id])
    redirect '/trips'
  end

  get '/trips-dashboard' do
    @most_trips_for_a_day =  Trip.most_trips_for_a_day
    @least_trips_for_a_day = Trip.least_trips_for_a_day
    @high_on_most_trips_day = Condition.high_on_most_trips_day
    @low_on_most_trips_day = Condition.low_on_most_trips_day
    # @weather_on_least_trips_day = Condition.weather_on_least_trips_day
    erb :"/trips/dashboard"
  end

  get '/conditions' do
    @conditions = Condition.all
    @conditions = Condition.paginate(:page => params[:page], per_page: 30)
    erb :"/conditions/index"
  end

  get '/conditions/new' do
    @condition = Condition.create(params[:condition])
    erb :"/conditions/new"
  end

  post '/conditions' do
    @condition = Condition.create(params[:condition])
    redirect "/conditions/#{@condition.id}"
  end

  get '/conditions-dashboard' do
    erb :"/conditions/dashboard"
  end
end
