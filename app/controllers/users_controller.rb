class UsersController < ApplicationController
  #signup

  get '/signup' do
    #load the signup form
    erb :'/users/new'
  end

  #receive our signup form submission
  post '/users' do
    # make sure they filled out the form entirely
    if params[:username] == "" || params[:password] == ""
      redirect '/signup'
    end

    # make sure they chose a username that is unique
    if User.find_by(username: params[:username])
      redirect '/signup'
    end

    # create a user
    user = User.create(params)

    # log the user in
    session[:user_id] = user.id

    # redirect them elsewhere
    redirect '/supersecret'
  end


end