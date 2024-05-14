class PersonMailer < ApplicationMailer
  default from: 'renangealves@gmail.com'

  def balance_report(user)
    @people = Person.order(:name)
    mail(to: user.email, subject: 'Relatório de Saldo')
  end
end