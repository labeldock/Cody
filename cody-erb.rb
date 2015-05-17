require 'ostruct'
require 'erb'
require 'json'
require 'active_support'

module Cody
    def self.version
        "0.0.4"
    end
    class ERBStruct < OpenStruct
        def initialize erb_path, params = {}
            @erb_path   = erb_path
            @erb_pwd    = @erb_path && File.split(@erb_path)[0]
            @erb_blocks = {}
            @erb_layout = nil
            @erb_buffer = 0
            super params
        end
        def include path, error_messege = nil
            begin
                path = File.expand_path(path,@erb_pwd)
                read = ''
                file = File.new path, "r"
                while line = file.gets
                    read += line
                end
                read
            rescue Exception => e
                error_messege ||= "no search include file"
                puts "ERROR : #{@erb_path} => #{error_messege}\n => #{path}\n#{e}"
            end
        end
        def layout path
            @erb_layout = self.include path, "no search layout file"
        end
        def partial path, datas = nil
            case datas
                when Array
                    #pass
                when Hash
                    datas = [datas]
                when nil
                    datas = []
                    puts "[warn] Cody::ERBStruct::partial_each #{path} => render data is nil"
                else
                    return "#{@erb_path} => Arguments(2) is must be Array or Hash\n path => #{path}\n data => (#{datas.class})#{datas}"
            end
            
            partial_text   = self.include path, 'no search partial file'
            partial_result = []
            datas.each do |data|
                #make model
                partial_model = {"data" => {}}
                data.each do |key, value|
                    partial_model["data"][key.to_sym] = value 
                end
                puts "data partial model => #{partial_model}"
                #model render result
                partial_result << Cody::ERBStruct.new(nil,partial_model).erb_result_with_text(partial_text)
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
                puts "Cody::ERBStruct::model error => #{e.message}"
                puts "parse model => #{json}"
            end
        end
        def block name, default = ""
            if @erb_blocks[name]
                @erb_blocks[name] ? @erb_blocks[name] : default
            else
                #buffer fix
                buffer = yield.strip
                @erb_blocks[name] = buffer[(@erb_buffer)..(buffer.length)].strip
                @erb_buffer = buffer.length
            end
        end
        
        def erb_result_with_text text
            erb_result = ERB.new(text).result(binding)
            erb_result = ERB.new(@erb_layout).result(binding) if @erb_layout
            return erb_result
        end
        
        def erb_result
            erb_result_with_text self.include(@erb_path, "no search file")
        end
    end
end
