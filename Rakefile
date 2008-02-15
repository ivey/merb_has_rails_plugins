require "rake/gempackagetask"
require 'fileutils'
include FileUtils

gems = %w[merb_has_flash merb_has_rails_plugins]

spec = Gem::Specification.new do |s|
  s.name         = "merb_for_rails"
  s.version      = "0.9.0"
  s.platform     = Gem::Platform::RUBY
  s.author       = "Michael D. Ivey"
  s.email        = "ivey@gweezlebur.com"
  s.homepage     = "http://rubyforge.org/projects/merb-plugins/"
  s.summary      = "A collection of Merb plugins to make the transition from Rails a little easier"
  s.description  = s.summary
  s.files        = %w( LICENSE README Rakefile )
  s.add_dependency "merb-core", ">= 0.9.0"
  gems.each do |gem|
    s.add_dependency gem, [">= 0.9", "<= 1.0"]
  end
end

windows = (PLATFORM =~ /win32|cygwin/) rescue nil

SUDO = windows ? "" : "sudo"

# desc "Installs Merb More."
# task :default => :install

Rake::GemPackageTask.new(spec) do |package|
  package.gem_spec = spec
end

desc "Install it all"
task :install => [:install_gems, :package] do
  sh %{#{SUDO} gem install pkg/merb_has_rails_plugins-0.9.0.gem}
end

desc "Build the sub-gems"
task :build_gems do
  gems.each do |dir|
    sh %{cd #{dir}; rake package}
  end
end

desc "Install the sub-gems"
task :install_gems do
  gems.each do |dir|
    sh %{cd #{dir}; #{SUDO} rake install}
  end
end

desc "Uninstall the sub-gems"
task :uninstall_gems do
  gems.each do |sub_gem|
    sh %{#{SUDO} gem uninstall #{sub_gem}}
  end
end

desc "Bundle up all the merb-more gems"
task :bundle => [:package, :build_gems] do
  mkdir "bundle"
  cp "pkg/merb-#{Merb::MORE_VERSION}.gem", "bundle"
  cp "pkg/merb-more-#{Merb::MORE_VERSION}.gem", "bundle"
  gems.each do |gem|
    File.open("#{gem}/Rakefile") do |rakefile|
      rakefile.read.detect {|l| l =~ /^VERSION\s*=\s*"(.*)"$/ }
      sh %{cp #{gem}/pkg/#{gem}-#{$1}.gem bundle/}
    end
  end
end
