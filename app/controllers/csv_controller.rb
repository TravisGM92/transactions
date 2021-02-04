# frozen_string_literal: true

class CsvController < ApplicationController
  def create
    info = FileToData.convert(params)
  end
end
