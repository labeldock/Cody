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

#less
# Dir.glob('**/*.less') do |less_path|
#     less_options = {
#         input: less_path, 
#         output: File.split(less_path)[0],
#         compress: true
#     }
#     guard :less, less_options do
#         watch less_path
#     end
# end

#js
# Dir.glob('**/*.js') do |js_path|
#     unless js_path.match(/.min.js$/)
#         guard "uglify", :input => 'js' do
#             watch js_path
#         end
#     end
# end

#inline-guard erb
require 'guard/compat/plugin'
require 'erb'
require 'ostruct'
module Cody
    class OpenStruct < OpenStruct
        def self.template(file, params={})
            Cody::OpenStruct.new(params).render(File.read(file))
        end
        def render(template)
            ERB.new(template).result(binding)
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
        basename  = File.basename(path).gsub(/\.erb$/,'.html')
        template  = Cody::OpenStruct.template(path)
        
        writepath = options[:output] + '/' + basename 
        abspath   = File.expand_path("../#{writepath}",__FILE__)
        
        File.open(abspath, 'w') do |f|
            f.write(template)
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
    guard 'erb', :input => erb_path, :output => File.split(erb_path)[0] do
        watch erb_path
    end
end

#livereload
guard 'livereload' do
  watch %r{^.*\.(html|css|js|png|jpg)$}
end