require 'English'
require 'fileutils'

dir = File.expand_path('..', __FILE__)
Dir.glob("#{dir}/easylist_generator/*.rb") do |file|
  require file
end

# Easylist Generator
module EasylistGenerator
  def self.head(header_file_path, content)
    header = File.read(header_file_path)
    header = format(header, version: VERSION)
    result = header + ($RS * 2)
    result += content

    result
  end

  def self.concat(src_glob)
    result = ''

    Dir.glob(src_glob) do |file_path|
      result += File.read(file_path) + $RS
    end

    result
  end

  def self.clean(dir)
    FileUtils.rm_rf(dir)
  end

  def self.ensure_dir(dir)
    Dir.mkdir(dir) unless Dir.exist?(dir)
  end
end
