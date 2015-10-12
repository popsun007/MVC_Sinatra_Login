class PostsController < ApplicationController
  post "/:id" do
    user_id = params[:id]
    Post.create(content: params[:Content], user_id: user_id)
    redirect "/users/#{user_id}"
  end
end