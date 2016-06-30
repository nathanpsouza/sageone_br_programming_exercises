require 'csv'

module Importer
  class Base
    attr_accessor :file_path, :parser

    def initialize file_path
      @file_path = file_path
      get_parser
    end

    def csv?
      File.extname(@file_path) == '.csv'
    end

    def import
      raise Importer::Parser::InvalidImportFile.new("Invalid file format") unless @parser.valid_file?

      records = @parser.parse

      ActiveRecord::Base.transaction do
        records.each do |record|
          product = Product.create(record)
        end
      end
    end

    private 
    def get_parser
      @parser = csv? ? ::Importer::Parser::Csv.new(file_path) : ::Importer::Parser::Txt.new(file_path)
    end
  end
end