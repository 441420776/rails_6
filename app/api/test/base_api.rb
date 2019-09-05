module Test
  class BaseApi < Grape::API
    prefix :test
    require 'doorkeeper/grape/helpers'
    helpers Doorkeeper::Grape::Helpers
    helpers Helpers
    format :json

    mount V1::GrapeApi

  end
end