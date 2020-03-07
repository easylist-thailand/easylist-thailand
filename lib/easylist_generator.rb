# frozen_string_literal: true

require 'English'
require 'fileutils'

dir = File.expand_path(__dir__)
Dir.glob("#{dir}/easylist_generator/*.rb").sort.each do |file|
  require file
end

# Easylist Generator
module EasylistGenerator
  def self.head(header_file_path, content)
    now = Time.now
    version = now.strftime '%Y%m%d%H%M'
    last_modified = now.strftime '%d %b %Y %H:%M %z'

    header = File.read(header_file_path)
    header = format(header, version: version, last_modified: last_modified)
    result = header + ($RS * 2)
    result += content

    result
  end

  def self.concat(src_glob)
    result = ''

    Dir.glob(src_glob) do |file_path|
      next if file_path.include? 'ublock'

      result += File.read(file_path) + $RS
    end

    result
  end

  def self.ublock
    <<~UBLOCK
      !#if ext_ublock
      !#include ublock.txt
      !#endif
    UBLOCK
  end

  def self.copy(src_file_path, dest_file_path)
    FileUtils.cp src_file_path, dest_file_path
  end

  def self.clean(dir)
    FileUtils.rm_rf(dir)
  end

  def self.ensure_dir(dir)
    Dir.mkdir(dir) unless Dir.exist?(dir)
  end
end
