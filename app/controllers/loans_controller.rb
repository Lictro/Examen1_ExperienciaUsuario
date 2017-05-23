class LoansController < ApplicationController
  def index
    @loans = Loan.all
  end


  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      redirect_to @loan
    else
      render 'new'
    end
  end

  def show
    @loan = Loan.find(params[:id])
    @payments = Payment.where(:id_loan => @loan.id)
  end

  def edit
    @loan = Loan.find(params[:id])
  end

  def update
    @loan = Loan.find(params[:id])
    if @loan.update(loan_params)
      redirect_to @loan
    else
      render 'edit'
    end
  end

  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy
  end

  private
    def loan_params
      params.require(:loan).permit(:client_name,:amount,:loan_type)
    end
end
