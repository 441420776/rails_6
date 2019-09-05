module Test
  module V1
    class Device < Grape::API
      resource :device do
        params do
          requires :device_uid, type: String, desc: 'device uid.'
        end
        group do

          before do
            # device_authenticate!
            status 200
          end

          desc '获取服药时间'
          get "get_time" do

            present :time_test, Time.zone.now

          end

        end
      end
    end
  end
end
