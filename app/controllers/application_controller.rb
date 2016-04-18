class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  require 'open-uri'
  require 'json'

  def consult
  	api_key=params[:api_key]
  	response = open('http://api.wunderground.com/api/'+api_key+'/hourly/q/zarate.json')

  	t = Time.now
  	future_hour = t + 8.hours

  	forecast = JSON.parse(response.read)


  	render plain: forecast["hourly_forecast"][7]["temp"]["metric"] # render with `text/plain` MIME type
  end
end
