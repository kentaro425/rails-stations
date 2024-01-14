class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
    @rows = @sheets.pluck(:row).uniq.sort
    @columns = @sheets.pluck(:column).uniq.sort
  end
end
