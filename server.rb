# Howto:
# 1. Install Ruby if you ain't got one.
# 2. Run `gem install bundler`.
# 3. From your project root, run `bundle install`.
# 4. Run `bundle exec ruby server.rb`.
# 5. Open http://localhost:4567/ in your browser.

require 'sinatra'

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