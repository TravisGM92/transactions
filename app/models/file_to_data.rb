# frozen_string_literal: true

class FileToData
  require 'csv'
  def self.convert(data)
    headers = CSV.read(data['file'].path, headers: true).headers
    PeopleConversionService.make_people(data) if headers[0].include?('name') && headers[1].include?('name')
  end

  def self.calculations(data)
    info = {}
    if data[0].class == Struct::Customer || data[0].class == Struct::Person
      info[:total_rows] = count(data)
    end
  end
end
