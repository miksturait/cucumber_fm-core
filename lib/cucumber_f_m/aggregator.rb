module CucumberFM
  class Aggregator
    def initialize(cfm, aggregator, multiple = false)
      if multiple
        @collection = Collection.nested_hash(0)
        multiple.each do |tag|
          cfm.scenarios.each do |scenario|
            @collection[tag].push scenario if scenario.tags.include?(tag)
          end
        end
      else
        @collection = Collection.nested_hash(aggregator.size)
        if aggregator.size == 2
          cfm.scenarios.each do |scenario|
            @collection[label(aggregator.first, scenario.tags_without_technical)][label(aggregator.last, scenario.tags_without_technical)][scenario.feature].push scenario
          end
        else
          @collection = Collection.nested_hash(1)
          cfm.scenarios.each do |scenario|
            @collection[label(aggregator.first, scenario.tags_without_technical)][scenario.feature].push scenario
          end
        end
      end
    end

    def collection
      @collection
    end

    private

    def label(aggregate, tags)
      tags.find { |tag| tag =~ aggregate } || '_undefined_'
    end

    class Collection < Hash

      include CucumberFM::FeatureElement::Component::TotalEstimation

      def features
        keys.collect { |key|
          self[key].is_a?(Array) ? key : self[key].features
        }.flatten.uniq
      end

      def scenarios
        values.collect { |value|
          value.is_a?(Array) ? value : value.scenarios
        }.flatten
      end

      def Collection.nested_hash (level=1)
        new do |hash, key|
          hash[key]= (level > 0 ? nested_hash(level-1) : ScenarioCollection.new)
        end
      end
    end
    class ScenarioCollection < Array

      include CucumberFM::FeatureElement::Component::TotalEstimation

      alias_method :scenarios, :entries
    end
  end
end
