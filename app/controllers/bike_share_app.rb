require 'will_paginate'
require 'will_paginate/active_record'

class BikeShareApp < Sinatra::Base

  get '/stations' do
    @stations = Station.all
    erb :"/stations/index"
  end

end
