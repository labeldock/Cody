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
        def initialize erb_path, params = {}
            @erb_path    = erb_path ? erb_path : nil
            @erb_blocks  = {}
            @erb_layout  = nil
            super params
        end
        def layout path
            begin
                path = File.expand_path(path,File.split(@erb_path)[0])
                read = ''
                file = File.new path, "r"
                while line = file.gets
                    read += line
                end
                @erb_layout = read
            rescue
                @erb_layout = "no search layout file #{path}"
            end
        end
        def block name
            puts "block name #{ name } #{ name.class }"
            puts "@erb_blocks #{ @erb_blocks } #{ @erb_blocks.class }"
            puts "@erb_blocks #{ @erb_blocks[name] }"
            if block_given?
                @erb_blocks[name] = yield
            else
                @erb_blocks[name]
            end
        end
        def include path
        end
        def partial path, data
        end
        def partial_each path, data
        end
        def erb_result
            erb = ERB.new(File.read(@erb_path))
            erb.result(binding)
            if @erb_layout
                erb = ERB.new(@erb_layout)
                erb.result(binding)
            end
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
        openstruct = Cody::OpenStruct.new(path)
        writepath     = options[:output] + '/' + basename 
        abs_writepath = File.expand_path("../#{writepath}",__FILE__)
        
        File.open(abs_writepath, 'w') do |f|
            result = openstruct.erb_result
            puts "ERB result = #{ result }"
            f.write result
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