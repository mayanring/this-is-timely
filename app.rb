require 'bundler'
require 'cgi'

Bundler.require

set :haml, :format => :html5

MINUTE = 60
HOUR = 3600
DAY = 86400
QUOTES = [ { :quote => "The only reason for time is so that everything doesn't happen at once.", :author => "Albert Einstein" },
           { :quote => "Are you telling me that you built a time machine...out of a DeLorean?", :author => "Marty McFly" },
           { :quote => "Time is money.", :author => "Benjamin Franklin" },
           { :quote => "The strongest of all warriors are these two &mdash; Time and Patience.", :author => "Leo Tolstoy" },
           { :quote => "Punctuality is the thief of time.", :author => "Oscar Wilde" } ]

helpers do
  def total_time_in_seconds(days, hours, minutes, seconds)
    seconds + minutes*MINUTE + hours*HOUR + days*DAY
  end
end

get '/about' do
  @body_id = "about"
  haml :about
end

get '/:time' do
  days = params[:time].match(/(\d+\s*)d/) { |m| m.captures[0] }
  hours = params[:time].match(/(\d+\s*)h/) { |m| m.captures[0] }
  minutes = params[:time].match(/(\d+\s*)m/) { |m| m.captures[0] }
  seconds = params[:time].match(/(\d+\s*)s/) { |m| m.captures[0] }

  @time = total_time_in_seconds(days.to_i, hours.to_i, minutes.to_i, seconds.to_i)

  if @time == 0
    status 400
    @body_id = "error"
    @message = QUOTES.sample
    haml :'400'
  else
    status 200
    @body_id = "timer"
    haml :timer
  end
end

get '/' do
	if !params[:time].nil? && !params[:time].empty?
		redirect to("/#{CGI.escape(params[:time])}")
	end

  @body_id = "landing"
	haml :index
end