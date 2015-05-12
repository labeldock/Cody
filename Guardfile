#sass
Dir.glob('**/*.scss') do |scss_path|
    scss_options = {
        input: scss_path,
        output: File.split(scss_path)[0]
    }
    guard 'sass', scss_options do
        watch scss_path
    end
end

#js
Dir.glob('**/*.js') do |js_path|
    unless js_path.match(/.min.js$/)
        js_options = {
            output: "#{File.split(js_path)[0]}/#{File.basename(js_path).gsub(/\.js$/,'.min.js')}"
        }
        guard "uglify", js_options do
            watch js_path
        end
    end
end

#inline-guard
require 'guard'
require 'erb'
require 'ostruct'

module Cody
    class OpenStruct < OpenStruct
        @layout_file_path = nil
        
        def self.template(file, params={})
            Cody::OpenStruct.new(params).render(file)
        end
        def layout path
            puts "parsing block #{path}"
            "layout result? me?"
        end
        def block path
            puts "parsing block #{path}"
        end
        def include path
            puts "include from #{ path }"
        end
        def render(file)
            ERB.new(File.read(file)).result(binding)
        end
    end
end

module ::Guard
  class Erb < Plugin
    def run_on_modifications(paths)
        paths.each{ |path| ouput_file path } if paths
    end
    private
    def ouput_file(path)
      begin
        basename   = File.basename(path).gsub(/\.erb$/,'.html')
        openstruct = 
        
        writepath     = options[:output] + '/' + basename 
        abs_writepath = File.expand_path("../#{writepath}",__FILE__)
        
        File.open(abs_writepath, 'w') do |f|
            Cody::OpenStruct.new.render(path)
            f.write(openstruct)
        end
        
        puts "Compiling #{path} to #{ writepath }"
        true
      rescue Exception => e
        puts "Compiling #{path} failed: #{e}"
        false
      end    
    end
  end
end

Dir.glob('**/*.erb') do |erb_path|
    erb_options = {
        input: erb_path,
        output: File.split(erb_path)[0]
    }
    guard 'erb', erb_options do
        watch erb_path
    end
end

#livereload
guard 'livereload' do
  watch %r{^.*\.(html|css|js|png|jpg)$}
end

# less not support yet
# Dir.glob('**/*.less') do |less_path|
#     less_options = {
#         output: File.split(less_path)[0],
#         compress: true
#     }
#     guard :less, less_options do
#         watch Regexp.new(less_path)
#     end
# end