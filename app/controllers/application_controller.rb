class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |userid, password|
      userid == 'admin' && password =='3333'
    end
  end
end
