class Loan < ApplicationRecord

  validates :client_name, presence: true, length: { maximum:20 }
  validates :amount, presence: true,numericality: { greater_than_or_equal_to: 5000 }


  def cantPres
    @loans = Loan.all
    total = 0
    @loans.each do |loan|
      total = total + 1
    end
    return total
  end

  def totalPrestamos
    if cantPres == 0
      return 0
    end
    @loans = Loan.all
    total = 0
    @loans.each do |loan|
      total = total + loan.amount
    end
    return total
  end

  def total_pays(id_cli)
    @payments = Payment.where(:id_loan => id_cli)
    total = 0
    @payments.each do |payment|
      total = payment.amount + total
    end
    return total
  end

  def balance(id_cli,amount)
    @loan = Loan.where(:id => id_cli)

    return amount - total_pays(id_cli)
  end

  def have_payments(id_cli)
    @payments = Payment.where(:id_loan => id_cli)
    total = 0
    @payments.each do |payment|
      total = 1 + total
    end
    return total
  end
end
