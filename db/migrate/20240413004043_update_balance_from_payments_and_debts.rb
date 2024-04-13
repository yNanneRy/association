class UpdateBalanceFromPaymentsAndDebts < ActiveRecord::Migration[7.1]
  def up
    Person.all.each do |person|
      total_payments = person.payments.sum(:amount)

      total_debts = person.debts.sum(:amount)

      person.balance = total_payments - total_debts
      person.save!
    end
  end

  def down
  end
end
