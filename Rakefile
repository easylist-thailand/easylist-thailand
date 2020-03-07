# frozen_string_literal: true

require 'colorize'
require 'rubocop/rake_task'

require './lib/easylist_generator'

task default: :generate

desc 'Clean subscription file.'
task :clean do
  EasylistGenerator.clean

  puts '[Clean] Subscription file removed.'.colorize(:red)
end

desc 'Generate subscription file.'
task generate: %i[clean] do
  EasylistGenerator.generate

  puts '[Generate] Subscription file created.'.colorize(:green)
end

RuboCop::RakeTask.new
