class AddIndexToDebt < ActiveRecord::Migration[7.1]
  def change
    execute <<-SQL
      CREATE INDEX index_debts_on_amount_partial ON debts(amount) WHERE amount > 100000
    SQL
  end
end
