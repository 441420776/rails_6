module Test
  module V1
    class GrapeApi < Grape::API
      version 'v1', using: :path, vendor: ''

      mount Test::V1::Device

    end
  end
end