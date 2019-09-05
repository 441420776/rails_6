module Tb
  module V1
    class Device < Grape::API
      resource :device do
        params do
          requires :device_uid, type: String, desc: 'device uid.'
        end
        group do

          before do
            patient_authenticate!
            status 200
          end

          desc '获取服药时间'
          get "get_time" do

            present :time_tb, Time.zone.now

          end

        end
      end
    end
  end
end
