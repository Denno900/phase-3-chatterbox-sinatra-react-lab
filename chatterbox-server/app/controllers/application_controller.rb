class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/' do
    "<h1>Hello</h1>"
  end

  get '/messages' do
    Message.all.order(:created_at).to_json
  end

  post '/messages' do
    Message.create(body: params[:body], username: params[:username])
  end

  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(body: params[:body])
  end

  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.destroy
  end
  
end
