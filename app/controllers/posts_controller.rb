require 'pry'

class PostsController < ApplicationController

  get '/posts' do 
    @posts = Post.all 
    erb :'posts/posts'
  end

  get '/posts/new' do 
    erb :'/posts/new'
  end

  post '/posts' do 
    @user = current_user
    @post = Post.create(params)
    @post.user_id = @user.id
    redirect '/posts'
  end
end