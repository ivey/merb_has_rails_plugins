require 'rubygems'
require 'rake/gempackagetask'

PLUGIN = "merb_has_rails_plugins"
NAME = "merb_has_rails_plugins"
VERSION = "0.1.1"
AUTHORS = ["Michael D. Ivey", "James Bebbington"]
EMAIL = "ivey@gweezlebur.com"
HOMEPAGE = "http://merb-plugins.rubyforge.org/merb_has_rails_plugins/"
SUMMARY = "Merb plugin that provides autoloading of Rails plugins from plugins/ dir"

spec = Gem::Specification.new do |s|
  s.name = NAME
  s.version = VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "LICENSE", 'TODO']
  s.summary = SUMMARY
  s.description = s.summary
  s.authors = AUTHORS
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.add_dependency('merb', '>= 0.5.0')
  s.require_path = 'lib'
  s.autorequire = PLUGIN
  s.files = %w(LICENSE README Rakefile TODO) + Dir.glob("{lib,specs}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

task :install => [:package] do
  sh %{sudo gem install pkg/#{NAME}-#{VERSION}}
end

task :release => :package do
  sh %{rubyforge add_release merb-plugins #{PLUGIN} #{VERSION} pkg/#{NAME}-#{VERSION}.gem}
end
