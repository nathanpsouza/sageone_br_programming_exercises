module Importer::Parser
  class Csv < Base
    def read_csv
      f = File.read(@file_path, encoding: 'windows-1252:utf-8')
      csv = CSV.parse(sanitize_csv(f), col_sep: ';', headers: false)
    end

    def load_records
      rows = read_csv
      products = []

      rows.each_with_index do |row, index|
        products << make_hash(row) if index > 0
      end

      products
    end

    def make_hash(row)
      {
        name: row[3],
        category: row[24] || row[23] || row[1] || row[0],
        external_code: row[4],
        description: row[3],
        barcode: row[10],
        ncm: row[17],
        unit: row[2],
        value: normalize_decimal(row[12] || row[11] || row[6]),
        quantity: row[9]
      }
    end

    def valid_file?
      header = File.open(@file_path, encoding: 'windows-1252:utf-8', &:readline)
      begin
        csv = CSV.parse(sanitize_csv(header), col_sep: ';', headers: false)
        return csv.first.size == 30
      rescue Exception => e
        return false
      end
    end

    def sanitize_csv string
      string.gsub(/\r/, '')
    end
  end
end