class SessionsController < ApplicationController
  #loggin in, logging out

  get '/supersecret' do
    #check to see if someone is logged_in
    if logged_in?
      erb :'/sessions/secrets'
    else
      redirect '/'
    end
  end

  get '/login' do
    erb :'/sessions/login'
  end

  #handle logging in
  post '/login' do

    #find the user
    user = User.find_by(username: params[:username])

    # does the user exist & did they put in the right password?
    if user && user.authenticate(params[:password])
      #log the user in
      session[:user_id] = user.id
      redirect '/supersecret'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end