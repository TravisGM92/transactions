# frozen_string_literal: true

class PeopleConversionService
  require 'csv'
  def self.make_people(data)
    customers = []
    headers = CSV.read(data['file'].path, headers: true).headers
    customer = Struct.new('Customer', *headers.map { |attr| attr })
    CSV.read(data['file'].path)[1..-1].each do |person|
      customers << customer.new(*person.map { |attr| attr })
    end
    customers
  end
end
