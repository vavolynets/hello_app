class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def empty
    uip = request.remote_ip
    uap = request.user_agent
    render html: "Hello,\nyour IP: [#{uip}]\nyour UA: (#{uap})\n"
  end
end
