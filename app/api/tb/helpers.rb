module Tb
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



    def current_patient_user
      doorkeeper_authorize! :write
      @current_user ||= (doorkeeper_token && ::Patient.find_by(id: doorkeeper_token.resource_owner_id)) || :false
    end

    def patient_authenticate!
      # pp doorkeeper_token
      doorkeeper_authorize! :write
    end

  end
end