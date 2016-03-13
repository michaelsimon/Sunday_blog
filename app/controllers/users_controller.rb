require 'pry'

class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get '/users/new' do
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
    @user = User.create(name: params["name"])
    @user.save
    redirect to :"/users/#{@user.slug}"
    #erb :'/users/show'
  end

  patch '/users/:slug' do

    @user = User.find_by_slug(params[:slug])
    #raise @user.inspect
    #@user.update(name: params["name"])
    @user.name = params["name"]

    @user.save
    redirect to :"/users"
  end






end



