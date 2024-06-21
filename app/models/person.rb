class Person < ApplicationRecord

  audited
  
  belongs_to :user, optional: true

  has_many :debts, dependent: :destroy
  has_many :payments, dependent: :destroy

  validates :name, :national_id, presence: true
  validates :national_id, uniqueness: true
  validate :cpf_or_cnpj

  private

  def cpf_or_cnpj
    if !CPF.valid?(national_id) && !CNPJ.valid?(national_id)
      errors.add :national_id, :invalid
    end
  end

  public def update_balance_payments(valor)
    self.balance = self.balance + valor
    self.save
  end

  public def update_balance_debts(valor)
    self.balance = self.balance - valor
    self.save
  end
  
end
