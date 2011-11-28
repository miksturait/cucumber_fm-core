# encoding: utf-8
module CucumberFM
  module FeatureElement
    class Background < Struct.new(:feature, :raw)

      I18N_WORDS = "Background:|Contexto:|Założenia:"

      PATTERN = /((^.*#+.*\n)+\n?)?^[ \t]*#{I18N_WORDS}.*\n?(^.*\S+.*\n?)*/

      include CucumberFM::FeatureElement::Component::Title
      include CucumberFM::FeatureElement::Component::Comments
    end
  end
end
