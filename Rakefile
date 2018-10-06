# frozen_string_literal: true

require 'colorize'
require 'rubocop/rake_task'

require './lib/easylist_generator'

task default: :generate

desc 'Clean subscription file.'
task :clean do
  EasylistGenerator.clean('./subscription')
  puts '[Clean] Subscription file removed.'.colorize(:red)
end

desc 'Generate subscription file.'
task generate: %i[clean] do
  content = EasylistGenerator.concat('./categories/*.txt')
  content = EasylistGenerator.head('./assets/header.txt', content)

  EasylistGenerator.ensure_dir('./subscription')
  File.open('./subscription/easylist-thailand.txt', 'w') do |file|
    file.puts(content)
  end

  puts '[Generate] Subscription file created.'.colorize(:green)
end

RuboCop::RakeTask.new
