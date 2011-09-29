require 'bundler'
require 'cgi'

Bundler.require

set :haml, :format => :html5

get '/:time' do
	
end

get '/' do
	if !params[:time].nil? && !params[:time].empty?
		redirect to("/#{CGI.escape(params[:time])}")	
	end

	haml :index
end