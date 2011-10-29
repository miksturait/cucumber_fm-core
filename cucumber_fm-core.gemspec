Gem::Specification.new do |s|
  s.name = 'cucumber_fm-core'
  s.version = '0.1'
  s.files = Dir['lib/**/*.rb'] + Dir['spec/**/*.rb'] + ['LICENCE']
  s.add_runtime_dependency 'diff-lcs'
  s.add_development_dependency 'rspec'
  s.summary = "Core libraries for parsing cucumber feature files"
  s.description = "Use it with cucumber_fm-plugin (<= Rails 3.0) or cucumber_fm-engine (>= Rails 3.1)"
  s.authors = ["Michał Czyż [@cs3b]"]
  s.email = 'michalczyz@gmail.com'
  s.homepage = 'http://cucumber.fm'

  s.license = 'MIT'
end
