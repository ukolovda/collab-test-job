require 'csv'
require 'net/http'
require 'tempfile'
require 'uri'
require 'open-uri'


class Word < ApplicationRecord

  SOURCE_URL = 'https://github.com/dwyl/english-words/blob/master/words.txt?raw=true'

  def self.upload
    upload_from_url SOURCE_URL
  end

  def self.upload_from_url(url)
    open(url, "rb") do |read_file|
      upload_from_io read_file
    end
  end

  def self.upload_file(file_name)
    File.open(file_name, 'r') do |file|
      upload_from_io file
    end
  end

  private
  
  # @param [IO] file
  def self.upload_from_io(file)
    transaction do
      # Clear old data
      unscoped.delete_all

      bulk_insert(:value, :locase_value, set_size: 10000) do |worker|
        file.each_line do |value|
          value.chomp!
          worker.add [value, value.downcase]
        end
      end
    end
  end
end
