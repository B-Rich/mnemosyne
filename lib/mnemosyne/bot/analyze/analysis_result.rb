require 'mnemosyne/bot/analyze/results'

module Mnemosyne
  module Bot
    class AnalysisResult
      attr_reader :concepts, :entities, :keywords, :categories,
                  :emotion, :metadata, :relations, :semantic_roles,
                  :sentiment, :language, :analyzed_text, :retrived_url,
                  :usage

      def initialize(attrs = {})
        @concepts = []
        build_concepts(attrs["concepts"]) if attrs["concepts"] != nil
        @entities = []
        build_entities(attrs["entities"]) if attrs["entities"] != nil
        @keywords = []
        build_keywords(attrs["keywords"]) if attrs["keywords"] != nil
        @categories = []
        build_categories(attrs["categories"]) if attrs["categories"] != nil
        @emotion = EmotionResult.new(attrs["emotion"]) if attrs["emotion"] != nil
        @metadata = Metadata.new(attrs["metadata"]) if attrs["metadata"] != nil
        @relations = []
        build_relations(attrs["relations"]) if attrs["relations"] != nil
        @semantic_roles = []
        build_semantic_roles(attrs["semantic_roles"]) if attrs["semantic_roles"] != nil
        @sentiment = SentimentResult.new(attrs["sentiment"]) if attrs["sentiment"] != nil
        @language = attrs["language"]
        @analyzed_text = attrs["analyzed_text"]
        @retrived_url = attrs["retrived_url"]
        @usage = Usage.new(attrs["usage"]) if attrs["usage"] != nil
      end

      def build_concepts(concepts)
        concepts.each do |concept|
          @concepts << ConceptResults.new(concept)
        end
      end

      def build_entities(entities)
        entities.each do |entitie|
          @entities << EntitiesResult.new(entitie)
        end
      end

      def build_keywords(keywords)
        keywords.each do |keyword|
            @keywords << KeywordsResult.new(keyword)
        end
      end

      def build_categories(categories)
        categories.each do |categorie|
            @categories << CategoriesResult.new(categorie)
        end
      end

      def build_relations(relations)
        relations.each do |relation|
            @relations << RelationsResult.new(relation)
        end
      end

      def build_semantic_roles(semantic_roles)
        semantic_roles.each do |semantic_role|
            @semantic_roles << SemanticRolesResult.new(semantic_role)
        end
      end
    end
  end
end
