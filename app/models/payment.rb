class Payment < ApplicationRecord
  belongs_to :person

  after_save :atualizar_balance

  def atualizar_balance
    self.person.update_balance_payments(self.amount)
  end

end
