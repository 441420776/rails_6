class DocsController < ApplicationController
  USER_NAME, PASSWORD = 'doc', '123456'

  before_action :basic_authenticate

  layout false

  def index
    pp "222222222"
  end

  private

  def basic_authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == USER_NAME && password == PASSWORD
    end
  end
end
