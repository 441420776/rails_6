module Tb
  module V1
    class GrapeApi < Grape::API
      version 'v1', using: :path, vendor: ''

      mount Tb::V1::Device

    end
  end
end