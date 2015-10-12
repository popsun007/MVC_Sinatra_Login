class UsersController < ApplicationController
  get '/' do
    @title = "All Users"
    erb :main_layout do
      @users = User.all
      erb :'users/index'
    end
  end

  get '/new' do
    @title = "New User"
    erb :main_layout do
      erb :'users/new'
    end
  end

  post '/new' do
    password_salt = BCrypt::Engine.generate_salt 
    User.create(email: params[:Email], first_name: params[:First_name], last_name: params[:Last_name], salt: password_salt , encrypted_password: BCrypt::Engine.hash_secret(params[:Password], password_salt ))
    redirect('/users')
  end
end