class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def create
    @payment =  Payment.new(payment_params)
    if @payment.save
      redirect_to @payment
    else
      render 'new'
    end
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
  end

  private
    def payment_params
      params.require(:payment).permit(:id_loan,:amount)
    end
end
