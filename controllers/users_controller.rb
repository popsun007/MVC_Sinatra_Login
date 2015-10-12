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
    redirect("/users")
  end

  get '/:id' do
    @user = User.find(params[:id])
    erb :'users/show'
  end

  get '/:id/edit' do
    @user = User.find(params[:id])
    erb :'users/edit'
  end

  post '/:id/edit' do
    @user = User.find(params[:id])
    @user.update(email: params[:Email], first_name: params[:First_name], last_name: params[:Last_name])
    redirect("/users")
  end

  post '/:id/delete_user' do
    User.find(params[:id]).destroy
    redirect("/users")
  end

end