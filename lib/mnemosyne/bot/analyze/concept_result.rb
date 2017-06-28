module Mnemosyne
  module Bot
    class ConceptResult
      attr_reader: :text, :relevance, :dbpedia_resource

      def initialize(attr = {})
        @text = attr["text"] 
        @relevance = attr["relevance"]
        @dbpedia_resource = attr["dbpedia_resource"]
      end
    end
  end
end
