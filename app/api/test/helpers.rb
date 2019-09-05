module Test
  module Helpers
    #API接口返回值模板
    def get_api_response(failure_index=[])
      res = {status: "success", code: 1}
      if failure_index.present?
        res[:status] = "failure"
        res[:code] = 0
        res[:failure_index] = failure_index.join(", ")
      end
      return res
    end

    def current_device
      unless MedicineBoxs::Device.get_xz_device_arr.include?(params[:device_uid].to_i)
        doorkeeper_authorize! :tuberculosis_device_read, :tuberculosis_device_write
      end

      # doorkeeper_authorize! :tuberculosis_device_read, :tuberculosis_device_write
      @current_device = MedicineBoxs::Device.find_by_device_uid(params[:device_uid])
    end

    def device_authenticate!
      error!('401 Unauthorized', 401) unless current_device.present?
    end

    def current_patient_user
      doorkeeper_authorize! :tuberculosis_app_write, :tuberculosis_app_read
      @current_user ||= (doorkeeper_token && ::Patient.find_by(id: doorkeeper_token.resource_owner_id)) || :false
    end

    def patient_authenticate!
      error!('401 Unauthorized', 401) if current_patient_user == :false
    end

    def current_director_user
      doorkeeper_authorize! :tuberculosis_app_write, :tuberculosis_app_read
      @current_user ||= (doorkeeper_token && ::Director.find_by(id: doorkeeper_token.resource_owner_id)) || :false
    end

    def director_authenticate!
      error!('401 Unauthorized', 401) if current_director_user  == :false
    end

    def jiwei_authenticate!
      doorkeeper_authorize! :public, :token_verify, :user_data_read
      error!('404 no find', 404) unless jiwei_current_user.present?
    end

    def jiwei_current_user
      @patient ||= Patient.find_by_id(params[:search]) || Patient.find_by_id_card_number(params[:search])
    end

  end
end