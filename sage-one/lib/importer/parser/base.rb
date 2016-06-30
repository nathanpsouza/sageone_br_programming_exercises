module Importer::Parser
  class Base
    attr_accessor :file_path

    def initialize file_path
      @file_path = file_path
    end

    def parse
      load_records
    end

    def normalize_decimal number
      return 0 if number.nil?
      number.gsub(',', '.')
    end
  end
end