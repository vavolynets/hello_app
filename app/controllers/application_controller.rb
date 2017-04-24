class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def empty
    uip = request.remote_ip
    uap = request.user_agent
    render html: "Hello,\r\n\r\nyour IP: [#{uip}]\r\n\r\nyour UA: (#{uap})\r\n\r\n"
  end
end
