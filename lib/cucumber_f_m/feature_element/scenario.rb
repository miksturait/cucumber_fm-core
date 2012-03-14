# encoding: utf-8
module CucumberFM
  module FeatureElement
    class Scenario < Struct.new(:feature, :raw)

      I18N_WORDS = "Scenario:|Scenariusz:"

      PATTERN = /((^.*#+.*\n)+\n?)?(^.*@+.*\n)?^[ \t]*(#{I18N_WORDS}).*\n?(^.*\S+.*\n?)*/

      include CucumberFM::FeatureElement::Component::Tags
      include CucumberFM::FeatureElement::Component::Title
      include CucumberFM::FeatureElement::Component::Comments

      def second_tags_source
        feature.info
      end
    end
  end
end
