module Mnemosyne
  module Bot
    class Models < Olimpo::Base
      def self.list(version)
        response = get("/models?version=#{version}")

        parsed_response = JSON.parse(response.body)
        return parsed_response if response.success?
        raise_exception(response.code, response.body)
      end

      def self.delete(model_id,version)
        response = delete("/models/#{model_id}?version=#{version}")

        parsed_response = JSON.parse(response.body)
        return parsed_response if response.success?
        raise_exception(response.code, response.body)
      end
    end
  end
end
