# encoding: utf-8
module CucumberFM
  module FeatureElement
    class ScenarioOutline < Struct.new(:feature, :raw)

      # TODO requires more specs and some improvements
      I18N_WORDS = "Scenario Outline:|Szablon scenariusza:"
      I18N_WORDS1 = "Examples:|Przykłady:"

      PATTERN = /((^.*#+.*\n)+\n?)?(^.*@+.*\n)?^[ \t]*(#{I18N_WORDS}).*\n?((^.*\S+.*\n?)*\n?)?(^[ \t]*(#{I18N_WORDS1}).*\n(^.*\S+.*\n?)*)?/

      include CucumberFM::FeatureElement::Component::Tags
      include CucumberFM::FeatureElement::Component::Title
      include CucumberFM::FeatureElement::Component::Comments

      def second_tags_source
        feature.info
      end

      private
      
      def title_line_pattern
        /^\s*Scenario Outline:\s.*$/
      end
    end
  end
end
