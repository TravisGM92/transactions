# frozen_string_literal: true

class FileToData
  require 'csv'
  def self.convert(data)
    headers = CSV.read(data['file'].path, headers: true).headers.map { |col| col.downcase }
    PeopleConversionService.make_people(data) if headers.any?(/name/)
  end
end
# name is all lowercase?
