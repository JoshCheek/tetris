desc 'Load game up in a console'
task :console do
  $LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
  require 'tetris'
  require 'pry'
  Pry.start
end

desc 'Test units with rspec'
task(:spec)     { sh 'rspec'    }

desc 'Run specs'
task default: [:spec]
