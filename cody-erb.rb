require 'ostruct'
require 'erb'
require 'json'

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
