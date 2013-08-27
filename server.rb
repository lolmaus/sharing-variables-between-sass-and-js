# Howto:
# 1. Install Ruby if you ain't got one.
# 2. Run `gem install sinatra`.
# 3. Put this file into the project folder, next to your `index.html`.
# 4. Run `ruby server.rb`.
# 5. Open http://localhost:4567/ .

require 'sinatra'

configure do
  mime_type :mp4, 'video/mp4'
  mime_type :ogg, 'video/ogv'
  mime_type :webm, 'video/webm'
  set :public_folder, File.dirname(__FILE__)
end

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/:name' do
  file = File.join(settings.public_folder, params[:name])
  if File.exist?(file)
    send_file file
  else
    halt 404
  end
end

get '/:path/:name' do
  file = File.join(settings.public_folder, params[:path], params[:name])
  if File.exist?(file)
    send_file file
  else
    halt 404
  end
end