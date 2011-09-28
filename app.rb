require 'bundler'
Bundler.require

set :haml, :format => :html5

get '/' do
    haml :index
end