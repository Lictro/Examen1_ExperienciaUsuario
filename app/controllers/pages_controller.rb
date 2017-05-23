class PagesController < ApplicationController
  def index
    @loan = Loan.first
  end
end
