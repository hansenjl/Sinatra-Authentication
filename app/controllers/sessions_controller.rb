class SessionsController < ApplicationController


  get '/supersecret' do
    erb :'/sessions/secrets'
  end

end