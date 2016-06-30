module Importer::Parser
  class Txt < Base
    def load_records
      rows = read_txt
    end

    def read_txt
      products = []
      File.open(@file_path, "r") do |infile|
        while (line = infile.gets)
          products << make_hash(line.gsub("\n", '').split("|")) if line.starts_with?("I")
        end
      end

      products
    end

    def make_hash(row)

      {
        name: row[2],
        category: '',
        external_code: row[1],
        description: row[2],
        barcode: row[9] || row[3],
        ncm: row[4],
        unit: row[10] || row[6],
        value: normalize_decimal(row[8] || row[11]),
        quantity: row[12]
      }
    end
  end
end