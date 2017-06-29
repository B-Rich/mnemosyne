module Mnemosyne
  module Bot
    class KeywordsResult
      attr_reader :relevance, :text, :emotion, :sentiment

      def initialize(attrs = {})
        @relevance = attrs["relevance"]
        @text = attrs["text"]
        @emotion = EmotionScores.new(attrs["emotion"]) if attrs["emotion"] != nil
        @sentiment = FeatureSentimentResults.new(attrs["sentiment"]) if attrs["sentiment"] != nil
      end
    end

    class EntitiesResult
      attr_reader :type, :relevance, :count, :text, :emotion, :sentiment, :disambiguation

      def initialize(attrs = {})
        @type = attrs["type"]
        @relevance = attrs["relevance"]
        @count = attrs["count"]
        @text = attrs["text"]
        @emotion = EmotionScores.new(attrs["emotion"]) if attrs["emotion"] != nil
        @sentiment = FeatureSentimentResults.new(attrs["sentiment"]) if attrs["sentiment"] != nil
        @disambiguation = DisambiguationResult.new(attrs["disambiguation"]) if attrs["disambiguation"] != nil
      end
    end

    class ConceptResult
      attr_reader :text, :relevance, :dbpedia_resource

      def initialize(attrs = {})
        @text = attrs["text"]
        @relevance = attrs["relevance"]
        @dbpedia_resource = attrs["dbpedia_resource"]
      end
    end

    class CategoriesResult
      attr_reader :label, :score

      def initialize(attrs = {})
          @label = attrs["label"]
          @score = attrs["score"]
      end
    end

    class EmotionResult
      attr_reader :document, :targets

      def initialize(attrs = {})
        @document = DocumentEmotionResults.new(attrs["document"]) if attrs["document"] != nil
        @targets  = []
        build_targets(attrs["targets"]) if attrs["targets"] != nil
      end

      def build_targets(targets)
        targets.each do |target|
          @targets << TargetedEmotionResults.new(target)
        end
      end
    end

    class MetadataResult
      attr_reader :authors, :publication_date, :title

        def initialize(attr = {})
          @authors = []
          @publication_date = attrs["publication_date"]
          @title = attrs["title"]
          build_authors(attrs["authors"])
        end

        def build_authors(authors)
          authors.each do |author|
            @authors << Author.new(author)
          end
        end
    end

    class RelationsResult
      attr_reader :score, :sentence, :type, :arguments

      def initialize( attrs = {})
        @score = attrs["score"]
        @sentence = attrs["sentence"]
        @type = attrs["type"]
        @arguments = []
        build_arguments(attrs["arguments"])
      end

      def build_arguments(arguments)
        arguments.each do |argument|
          @arguments << RelationArgument.new(argument)
        end
      end
    end

    class SemanticRolesResult
      attr_reader :sentence, :subject, :action, :object

      def initialize(attrs = {})
        @sentence = attrs["sentence"]
        @subject = SemanticRolesSubject.new(attrs["subject"]) if attrs["subject"] != nil
        @action = SemanticRolesAction.new(attrs["action"]) if attrs["action"] != nil
        @object = SemanticRolesObject.new(attrs["object"]) if attrs["object"] != nil
      end
    end

    class SentimentResult
      attr_reader :document, :targets

      def initialize(attrs = {})
        @document = DocumentSentimentResults.new(attrs["document"])
        @targets  = []
        build_targets(attrs["targets"]) if attrs["targets"] != nil
      end

      def build_targets(targets)
        targets.each do |target|
          @targets << TargetedSentimentResults.new(target)
        end
      end
    end

    class FeatureSentimentResults
      attr_reader :score

      def initialize(attrs = {})
        @score = attrs["score"]
      end
    end

    class DisambiguationResult
      attr_reader :name, :dbpedia_resource, :subtype

      def initialize(attrs = {})
        @name = attrs["name"]
        @dbpedia_resource = attrs["string"]
        @subtype = attrs["subtype"]
      end
    end

    class DocumentEmotionResults
      attr_reader :emotion

      def initialize(attrs = {})
        @emotion = EmotionScores.new(attrs["emotion"]) if attrs["emotion"] != nil
      end
    end

    class TargetedEmotionResults
      attr_reader :text, :emotion

      def initialize(attrs = {})
        @text = attrs["text"]
        @emotion = EmotionScores.new(attrs["emotion"]) if attrs["emotion"] != nil
      end
    end

    class DocumentSentimentResults
      attr_reader :score

      def initialize(attrs = {})
        @score = attrs["score"]
      end
    end

    class TargetedSentimentResults
      attr_reader :text, :score

      def initialize(attrs = {})
        @text = attrs["text"]
        @score = attrs["score"]
      end
    end

    class Usage
      attr_reader :usage

      def initialize(attrs = {})
        @usage = attrs["usage"]
      end
    end

    class EmotionScores
      attr_reader :anger, :disgust, :fear, :joy, :sadness

      def initialize(attrs = {})
        @anger = attrs["anger"]
        @disgust = attrs["disgust"]
        @fear = attrs["fear"]
        @joy = attrs["joy"]
        @sadness = attrs["sadness"]
      end
    end

    class Author
      attr_reader :author

      def initialize(attrs = {})
        @author = attrs["author"]
      end
    end

    class RelationArgument
      attr_reader :entities, :text

      def initialize(attrs = {})
        @entities = []
        @text = attrs["text"]
        build_entities(attrs["entities"]) if attrs["entities"] != nil
      end

      def build_entities(entities)
        entities.each do |entitie|
          @entities << RelationEntity.new(entitie)
        end
      end
    end

    class SemanticRolesSubject
      attr_reader :text, :entities, :keywords

      def initialize(attrs = {})
          @text = attrs["text"]
          @entities = []
          @keywords = []
          build_entities(attrs["entities"]) if attrs["entities"] != nil
          build_keywords(attrs["keywords"]) if attrs["keywords"] != nil
      end

      def build_keywords(keywords)
        keywords.each do |keyword|
          @keywords << SemanticRolesKeyword.new(keyword)
        end
      end

      def build_entities(entities)
        entities.each do |entitie|
          @entities << SemanticRolesEntity.new(entitie)
        end
      end
    end

    class SemanticRolesAction
      attr_reader :text, :normalized, :verb

      def initialize(attrs = {})
        @text = attrs["text"]
        @normalized = attrs["normalized"]
        @verb = SemanticRolesVerb.new(attrs["verb"]) if attrs["verb"] != nil
      end
    end

    class SemanticRolesObject
      attr_reader :text, :keywords

      def initialize(attrs = {})
        @text = attrs["text"]
        @keywords = []
        build_keywords(attrs["keywords"]) if attrs["keywords"] != nil
      end

      def build_keywords(keywords)
        keywords.each do |keyword|
          @keywords << SemanticRolesKeyword.new(keyword)
        end
      end
    end

    class SemanticRolesKeyword
      attr_reader :text
      def initialize(attrs = {})
        @text = attrs["text"]
      end
    end

    class SemanticRolesVerb
      attr_reader :text, :tense
      def initialize(attrs = {})
        @text = attrs["text"]
        @tense = attrs["tense"]
      end
    end
  end
end
