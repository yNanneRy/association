class DashboardService

    def self.find_people_counts
        Rails.cache.fetch('people_counts', expires_in: 1.hour) do
            active_count = Person.where(active: true).count
            inactive_count = Person.where(active: false).count
            { active: active_count, inactive: inactive_count }
        end
    end

    def self.find_people_active
        Rails.cache.fetch('people_active', expires_in: 1.hour) do
            Person.where(active: true).select(:id)
        end
    end

    def self.find_total_debts(active_people_ids)
        Rails.cache.fetch('total_debts', expires_in: 1.hour) do
            Debt.where(person_id: active_people_ids).sum(:amount)
        end
    end

    def self.find_total_payments(active_people_ids)
        Rails.cache.fetch('total_payments', expires_in: 1.hour) do
            Payment.where(person_id: active_people_ids).sum(:amount)
        end
    end

    def self.find_lasts_debts
        Rails.cache.fetch('lasts_debts', expires_in: 1.hour) do
            Debt.order(created_at: :desc).limit(10).map do |debt|
                [debt.id, debt.amount]
            end
        end
    end

    def self.find_lasts_payments
        Rails.cache.fetch('lasts_payments', expires_in: 1.hour) do
            Payment.order(created_at: :desc).limit(10).map do |payment|
                [payment.id, payment.amount]
            end
        end
    end

    def self.find_my_people(current_user)
        Rails.cache.fetch('my_people', expires_in: 1.hour) do
            Person.where(user: current_user).order(:created_at).limit(10)
        end
    end

    def self.find_people
        Rails.cache.fetch('people', expires_in: 1.hour) do
            Person.all.select do |person|
                person.balance > 0
            end.sort_by do |person|
                person.balance
            end
        end
    end

    def self.find_people_over_hundred
        Debt.includes(:person).where("amount > 100000").limit(10)
    end
end