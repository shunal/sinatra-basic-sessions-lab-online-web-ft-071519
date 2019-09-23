require_relative 'config/environment'

class App < Sinatra::Base
  
  configure do
  enable :sessions # session = {}
  set :session_secret, "secret"
end

  get "/" do 
    erb :index
  end
  
  post "/checkout" do 
    
    session[:item]= params[:item]
    
    redirect "/response"
    
  end 
  
  get "/response" do
    @item = session[:item]
    
    erb :response
  end
  
end