require 'spec_helper'

describe Mnemosyne::Bot::Analyze do
  describe '.analyze' do
    it "should return a instance of type Mnemosyne::Bot::AnalysisResult" do
      stub_response = AnalyzeResponseExample.new
      allow(Mnemosyne::Bot::Analyze).to receive(:post).and_return(stub_response)
      expect(Mnemosyne::Bot::Analyze.analyze("","")).to be_kind_of(Mnemosyne::Bot::AnalysisResult)
    end
  end

  describe '.get_analyze' do
    it "should return a instance of type Mnemosyne::Bot::AnalysisResult" do
      stub_response = GetAnalyzeResponseExample.new
      allow(Mnemosyne::Bot::Analyze).to receive(:get).and_return(stub_response)
      expect(Mnemosyne::Bot::Analyze.get_analyze("","")).to be_kind_of(Mnemosyne::Bot::AnalysisResult)
    end
  end
end


class AnalyzeResponseExample
  def success?
    true
  end

  def body
          '{
        "language": "en",
        "keywords": [
          {
            "text": "American multinational technology",
            "sentiment": {
              "score": 0
            },
            "relevance": 0.993518,
            "emotion": {
              "sadness": 0.066777,
              "joy": 0.009568,
              "fear": 0.021594,
              "disgust": 0.097735,
              "anger": 0.028562
            }
          },
          {
            "text": "New York",
            "sentiment": {
              "score": 0
            },
            "relevance": 0.613816,
            "emotion": {
              "sadness": 0.174646,
              "joy": 0.161733,
              "fear": 0.054825,
              "disgust": 0.058751,
              "anger": 0.055965
            }
          }
        ],
        "entities": [
          {
            "type": "Company",
            "text": "IBM",
            "sentiment": {
              "score": 0
            },
            "relevance": 0.33,
            "emotion": {
              "sadness": 0.066777,
              "joy": 0.009568,
              "fear": 0.021594,
              "disgust": 0.097735,
              "anger": 0.028562
            },
            "disambiguation": {
              "subtype": [
                "SoftwareLicense",
                "OperatingSystemDeveloper",
                "ProcessorManufacturer",
                "SoftwareDeveloper",
                "CompanyFounder",
                "ProgrammingLanguageDesigner",
                "ProgrammingLanguageDeveloper"
              ],
              "name": "IBM",
              "dbpedia_resource": "http://dbpedia.org/resource/IBM"
            },
            "count": 1
          }
        ]
      }'
  end
end

class GetAnalyzeResponseExample
  def success?
    true
  end

  def body
  '{
      "language": "en",
      "categories": [
        {
          "score": 0.252672,
          "label": "/technology and computing"
        },
        {
          "score": 0.165837,
          "label": "/business and industrial"
        },
        {
          "score": 0.160846,
          "label": "/business and industrial/business operations"
        }
      ]
    }'
  end
end
