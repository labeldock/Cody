#erb
#guard 'erb', :input => 'erb', :output => 'html' do 
#    watch %r{^.*\.erb$}
#end

#sass
guard 'sass', :input => 'scss', :output => 'css' do
    watch %r{^.*\.scss$}
end

#less
guard :less, :input => 'less', output: 'css' do
    watch %r{^.*\.less$}
end

#js
guard "uglify", :input => 'js', :output => 'min.js' do
    watch %r{^.*\.js$}
end

#livereload
guard 'livereload' do
  watch %r{^.*\.(html|css|js|png|jpg)$}
end