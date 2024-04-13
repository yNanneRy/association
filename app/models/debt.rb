class Debt < ApplicationRecord
  belongs_to :person

  validates :amount, presence: true

  after_save :atualizar_balance

  def atualizar_balance
    self.person.update_balance_debts(self.amount)
  end

end
