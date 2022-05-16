class ApplicationController < ActionController::Base
  before_action if: :devise_controller? do
    headers['Access-Control-Allow-Origin'] = request.origin
  end
end
