class ReportsController < ApplicationController
  def balance
    @user = current_user
    PersonMailer.balance_report(@user).deliver_later
    redirect_to root_path, notice: 'Relatório de saldo enviado com sucesso.'
  end
end
