module Tb
  class BaseApi < Grape::API
    prefix :tb
    require 'doorkeeper/grape/helpers'
    helpers Doorkeeper::Grape::Helpers
    helpers Helpers
    format :json

    mount V1::GrapeApi
    mount V2::GrapeApi

  end
end