Gem::Specification.new do |s|
  s.name = "merb_has_rails_plugins"
  s.author = "Michael D. Ivey"
  s.version = "0.1.2"
  s.platform = Gem::Platform::RUBY
  s.date = "2008-06-30"
  s.summary = "Merb plugin that provides autoloading of Rails plugins from plugins/ dir"
  s.email = "ivey@gweezlebur.com"
  s.homepage = "http://github.com/ivey/merb_has_rails_plugins"
  s.description = s.summary
  s.has_rdoc = false
  s.files = ["LICENSE", "Rakefile", "README", "TODO", "lib/merb_has_rails_plugins.rb"]
  s.test_files = []
  s.add_dependency("merb-core", ["> 0.9.0"])
end
