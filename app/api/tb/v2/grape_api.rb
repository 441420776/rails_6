module Tb
  module V2
    class GrapeApi < Grape::API
      version 'v2', using: :path, vendor: ''

      mount Tb::V2::Device

    end
  end
end