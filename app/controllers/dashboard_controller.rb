require_relative '../services/dashboard_service'

class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @active_people_pie_chart = DashboardService.find_people_counts

    active_people_ids = DashboardService.find_people_active
    @total_debts = DashboardService.find_total_debts(active_people_ids)
    @total_payments = DashboardService.find_total_payments(active_people_ids)
    @balance = @total_payments - @total_debts

    @last_debts = DashboardService.find_lasts_debts
    @last_payments = DashboardService.find_lasts_payments

    @my_people = DashboardService.find_my_people(current_user)

    people = DashboardService.find_people

    @top_person = people.last

    @bottom_person = people.first

    @people_over_hundred = DashboardService.find_people_over_hundred
  end
end