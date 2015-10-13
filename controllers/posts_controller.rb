class PostsController < ApplicationController
  
  post "/:id" do
    user_id = params[:id]
    Post.create(content: params[:Content], user_id: user_id)
    redirect "/users/#{user_id}"
  end

  delete "/:id/delete_post" do
    erb :main_layout do
      user = User.find(params[:user_id])
      post = Post.find(params[:id])
      post.destroy
      redirect "/users/#{user.id}"
    end
    # post_id = params[:id]
    # user_id = params[:user_id]
    # Post.find(post_id).destroy
    # redirect "/users/#{user_id}"
  end

end