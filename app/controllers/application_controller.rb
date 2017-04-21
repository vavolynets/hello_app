class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def empty
    uip = request.remote_ip
    uap = request.user_agent
    render html: "Hello,\n\ryour IP: [#{uip}]\n\ryour UA: (#{uap})\n\r"
  end
end
