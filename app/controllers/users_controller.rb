require 'pry'

class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get '/users/new' do
    @error_message = params[:error]
    erb :'/users/new'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  get '/users/:slug/edit' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/edit'
  end



  delete '/users/:slug/delete' do 
    @user = User.find_by_slug(params[:slug])
    @user.delete
    redirect to :"/users"
  end


  post '/users' do
    #redirect if not logged in

    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect :'/posts'
    else
      redirect '/users/new?error=invalid user'

      
    end
  end

  patch '/users/:slug' do

    @user = User.find_by_slug(params[:slug])
    #raise @user.inspect
    #@user.update(name: params["name"])
    @user.name = params["name"]

    @user.save
    redirect to :"/users"
  end

  get '/logout' do 
    session.clear
    redirect '/login'
  end

  get '/login' do 
    erb :'/users/login'
  end

  post '/login' do 
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/posts'
    else
      redirect '/login'
    end
  end







end



