require 'bundler'
require 'cgi'

Bundler.require

set :haml, :format => :html5

get '/:time' do
  days = params[:time].match(/(\d+\s*)d/) { |m| m.captures[0] }
  hours = params[:time].match(/(\d+\s*)h/) { |m| m.captures[0] }
  minutes = params[:time].match(/(\d+\s*)m/) { |m| m.captures[0] }
  seconds = params[:time].match(/(\d+\s*)s/) { |m| m.captures[0] }

  if !days && !hours && !minutes && !seconds
    "No time was found!"
  else
    "#{days} days, #{hours} hours, #{minutes} minutes, #{seconds} seconds"
  end
end

get '/' do
	if !params[:time].nil? && !params[:time].empty?
		redirect to("/#{CGI.escape(params[:time])}")
	end

	haml :index
end