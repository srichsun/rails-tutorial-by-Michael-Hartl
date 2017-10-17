class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def yo
    render html: "YO"
  end
end
