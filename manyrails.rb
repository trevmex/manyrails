require 'rubygems'
require 'sinatra'

get '/:port' do
  config = ::File.expand_path("../subrails#{params[:port]}/config.ru",  __FILE__)
  Thread.new do
    system "rackup #{config}"
  end
  sleep(2)
  redirect "http://localhost:300#{params[:port]}/"
end
