class SessionsController < ApplicationController
  get '/new' do
    erb :main_layout do
      erb :"sessions/new"
    end
  end
  post '/' do
    user = User.find_by(email: params[:Email])
    if user && user.encrypted_password == BCrypt::Engine.hash_secret(params[:Password], user.salt)
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      session[:errors] = 'Invalid email/password combination'
      redirect '/sessions/new'
    end
  end
end