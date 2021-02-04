# frozen_string_literal: true

class FileToData
  require 'csv'
  def self.convert(data)
    headers = CSV.read(data['file'].path, headers: true).headers
    CustomerConversionService.make_customer(data) if headers[0].include?('name') && headers[1].include?('name')
  end
end
