require 'bundler'
require 'cgi'

Bundler.require

set :haml, :format => :html5

MINUTE = 60
HOUR = 3600
DAY = 86400

helpers do
  def total_time_in_seconds(days, hours, minutes, seconds)
    seconds + minutes*MINUTE + hours*HOUR + days*DAY
  end
end

get '/:time' do
  days = params[:time].match(/(\d+\s*)d/) { |m| m.captures[0] }
  hours = params[:time].match(/(\d+\s*)h/) { |m| m.captures[0] }
  minutes = params[:time].match(/(\d+\s*)m/) { |m| m.captures[0] }
  seconds = params[:time].match(/(\d+\s*)s/) { |m| m.captures[0] }

  @time = total_time_in_seconds(days.to_i, hours.to_i, minutes.to_i, seconds.to_i)

  if @time == 0
    "No time was found!"
  else
    "#{@time}"
  end
end

get '/' do
	if !params[:time].nil? && !params[:time].empty?
		redirect to("/#{CGI.escape(params[:time])}")
	end

	haml :index
end