# frozen_string_literal: true

require 'English'
require 'fileutils'

current_dir = File.expand_path __dir__
Dir.glob("#{current_dir}/easylist_generator/*.rb").sort.each do |file|
  require file
end

SUBSCRIPTION_DIR = File.expand_path '../subscription/', __dir__
SUBSCRIPTION_FILE_PATH = "#{SUBSCRIPTION_DIR}/easylist-thailand.txt"
HEADER_FILE_PATH = File.expand_path '../assets/header.txt', __dir__
CATEGORIES_DIR = File.expand_path '../categories/', __dir__
UBLOCK_FILENAME = 'ublock.txt'
UBLOCK_DIRECTIVE = <<~UBLOCK.strip
  !#if ext_ublock
  !#include #{UBLOCK_FILENAME}
  !#endif
UBLOCK

# Easylist Generator
module EasylistGenerator
  ##
  # Ensure subscription directory exist.
  def self.ensure_dir
    Dir.mkdir SUBSCRIPTION_DIR unless Dir.exist? SUBSCRIPTION_DIR
  end

  ##
  # Get subscription header content.
  def self.head
    now = Time.now.getlocal '+07:00' # Thai time
    version = now.strftime '%Y%m%d%H%M'
    last_modified = now.strftime '%d %b %Y %H:%M %z'

    header = File.read HEADER_FILE_PATH
    header = format header, version: version, last_modified: last_modified

    header
  end

  ##
  # Concat all filters from categories directory.
  def self.concat
    src_glob = "#{CATEGORIES_DIR}/*.txt"

    result = ''

    Dir.glob(src_glob).sort.each do |file_path|
      next if file_path.include? 'ublock'

      result += File.read(file_path) + $RS
    end

    result
  end

  ##
  # Copy uBlock specific filters
  # from categories directory to subscription directory.
  def self.ublock
    src_file = "#{CATEGORIES_DIR}/#{UBLOCK_FILENAME}"
    dest_file = "#{SUBSCRIPTION_DIR}/#{UBLOCK_FILENAME}"

    FileUtils.copy src_file, dest_file
  end

  ##
  # Generate subscription files.
  def self.generate
    content = head + ($RS * 2) + concat + UBLOCK_DIRECTIVE

    ensure_dir

    File.open(SUBSCRIPTION_FILE_PATH, 'w') do |file|
      file.puts content
    end

    ublock
  end

  ##
  # Clean subscription directory.
  def self.clean
    FileUtils.rm_rf SUBSCRIPTION_DIR
  end

  private_class_method :ensure_dir, :head, :concat, :ublock
end
