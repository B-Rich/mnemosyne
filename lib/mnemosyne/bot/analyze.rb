require 'mnemosyne/bot/analyze/analysis_result'

module Mnemosyne
  module Bot
    class Analyze < Olimpo::Base
      def self.analyze(version, parameters)
        response = post("/analyze?version=#{version}", body: parameters,
                                                       headers: { "Content-Type" => "application/json" })

        parsed_response = JSON.parse(response.body)
        return Mnemosyne::Bot::AnalysisResult.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end

      def self.get_analyze(version, parameters = {})
        response = get("/analyze?version=#{version}", query: parameters)

        parsed_response = JSON.parse(response.body)
        return Mnemosyne::Bot::AnalysisResult.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end
    end
  end
end
