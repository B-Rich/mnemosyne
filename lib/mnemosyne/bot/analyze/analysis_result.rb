module Mnemosyne
  module Bot
    class AnalysisResult
      attr_reader: :concepts, :entities, :keywords, :categories,
                   :emotion, :metadata, :relations, :semantic_roles,
                   :sentiment, :language, :analyzed_text, :retrived_url,
                   :usage

      def initialize(attr = {})
        @concepts = []
        @entities = []
        @keywords = []
        @categories = []
        @emotion = EmotionResult.new(attr["emotion"])
        @metadata = Metadata.new(attr["metadata"])
        @relations = []
        @semantic_roles = []
        @sentiment = SentimentResult.new(attr["sentiment"])
        @language = attr["language"]
        @analyzed_text = attr["analyzed_text"]
        @retrived_url = attr["retrived_url"]
        @usage = Usage.new(attr["usage"])

        build_concepts(attr["concepts"])
      end

      def build_concepts(concepts)
        concepts.each do |concept|
          @concepts << ConceptResults.new(concept)
        end
      end
    end
  end
end
