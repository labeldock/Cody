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
require 'json'
require 'ostruct'

module Cody
    class ERBStruct < OpenStruct
        def initialize erb_path, params = {}
            @erb_path    = erb_path
            @erb_blocks  = {}
            @erb_layout  = nil
            super params
        end
        def include path, error_messege = nil
            begin
                path = File.expand_path(path,File.split(@erb_path)[0])
                read = ''
                file = File.new path, "r"
                while line = file.gets
                    read += line
                end
                read
            rescue Exception => e
                error_messege ||= "no search include file"
                "ERROR : #{@erb_path} => #{error_messege}\n => #{path}\n#{e}"
            end
        end
        def layout path
            @erb_layout = self.include path, "no search layout file"
        end
        def partial path, datas
            case datas
                when Array
                    #pass
                when Hash
                    datas = [datas]
                else
                    return "#{@erb_path} => Arguments(2) is must be Array or Hash\n path => #{path}\n data => (#{datas.class})#{datas}"
            end
            partial_text   = self.include path, 'no search partial file'
            partial_result = []
            
            datas.each do |data|
                #make model
                partial_model = {"model" => {}}
                data.each{ |key, value| partial_model["model"][key.to_sym] = value }
                #model render result
                partial_result << Cody::ERBStruct.new(@erb_path,partial_model).erb_result_with_text(partial_text)
            end
            partial_result.join "\n"
        end
        def model path
            begin
                json = self.include path, "no search model file"
                result = JSON.parse(json)
                puts "model(json) load result => #{ result }"
                result
            rescue Exception => e
                puts e.message
            end
        end
        def block name
            if block_given?
                @erb_blocks[name] = yield
            else
                @erb_blocks[name]
            end
        end
        
        def erb_result_with_text text
            erb_result = ERB.new(text).result(binding)
            erb_result = ERB.new(@erb_layout).result(binding) if @erb_layout
            return erb_result
        end
        
        def erb_result
            erb_result_with_text self.include("../#{@erb_path}", "no search file")
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
        basename      = File.basename(path).gsub(/\.erb$/,'.html')
        openstruct    = Cody::ERBStruct.new(path)
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
    file_path = File.split(erb_path)
    unless file_path[1].match /^\_/
        erb_options = {
            input: erb_path,
            output: file_path[0]
        }
        guard 'erb', erb_options do
            watch erb_path
        end
    end 
end

#livereload
livereload_options = {
    host: '0.0.0.0',
    port: '3300',
    apply_css_live: true,
    grace_period: 0
}

guard 'livereload', livereload_options do
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