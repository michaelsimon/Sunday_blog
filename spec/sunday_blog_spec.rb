require_relative "spec_helper"
require_relative "../sunday_blog.rb"

def app
  SundayBlog
end

describe SundayBlog do
  it "responds with a welcome message" do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end
