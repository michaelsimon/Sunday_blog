class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  set :session_secret, "blogsecret"

  get '/' do
    erb :'/users/new'
  end

  helpers do 

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end


  end #helpers


end #class

