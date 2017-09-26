require 'will_paginate'
require 'will_paginate/active_record'

class BikeShareApp < Sinatra::Base

  get '/stations' do
    @stations = Station.all
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

end
