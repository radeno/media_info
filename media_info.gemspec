require File.expand_path('../lib/media_info/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'media_info'
  s.version     = Gem::Version.new(MediaInfo::Version::NUMBER)

  s.summary     = 'A simple meta information about files with MediaInfo.'
  s.homepage    = 'http://github.com/radeno/media_info'
  s.authors     = ['Radovan Smitala']
  s.license     = 'MIT'

  s.files         = Dir['lib/**/*.rb']
  s.require_paths = ['lib']

  s.requirements << 'mediainfo, >= 18.12'
  s.required_ruby_version = '>= 2.0'

  s.add_dependency 'rexml'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'pry'

  s.add_development_dependency 'reek'
  s.add_development_dependency 'rubocop'
end
