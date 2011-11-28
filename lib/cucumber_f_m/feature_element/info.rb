module CucumberFM
  module FeatureElement
    class Info < Struct.new(:feature, :raw)
      I18N_WORDS = "Feature:|Funcionalidade:|Właściwość:"
      
      PATTERN = /((^.*#+.*\n)+\n?)?(^.*@+.*\n)?^[ \t]*#{I18N_WORDS}.*\n?(^.*\S+.*\n?)*/

      include CucumberFM::FeatureElement::Component::Tags
      include CucumberFM::FeatureElement::Component::Title
      include CucumberFM::FeatureElement::Component::Comments

    end
  end
end
