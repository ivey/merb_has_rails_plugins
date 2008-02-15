# make sure we're running inside Merb
if defined?(Merb::Plugins)
  puts "Loading Rails plugins from plugins/"
  Dir["#{Merb.root}/plugins/*"].each do |dir|
    plugin_init = dir / 'init.rb'
   	plugin_lib  = dir / 'lib' 
   	
   	if File.directory?(plugin_lib) 
   	  if defined?(ActiveSupport) 
   	    Dependencies.load_paths << plugin_lib 
   	    Dependencies.load_once_paths << plugin_lib 
      end
      $LOAD_PATH << plugin_lib
    end
    require plugin_init if File.exist?(plugin_init)
  end
end
