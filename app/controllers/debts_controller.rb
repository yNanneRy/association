class DebtsController < ApplicationController
  before_action :set_debt, only: %i[ show edit update destroy ]

  def index
    @debts = Debt.includes(:person).all.paginate(page: params[:page], per_page: 100)
  end

  def show
  end

  def new
    @debt = Debt.new
  end

  def edit
  end

  def create
    @debt = Debt.new(debt_params)

    respond_to do |format|
      if @debt.save
        format.html { redirect_to debt_url(@debt), notice: "Debt was successfully created." }
        format.json { render :show, status: :created, location: @debt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @debt.update(debt_params)
        format.html { redirect_to debt_url(@debt), notice: "Debt was successfully updated." }
        format.json { render :show, status: :ok, location: @debt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @debt.destroy!

    respond_to do |format|
      format.html { redirect_to debts_url, notice: "Debt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_debt
      @debt = Debt.find(params[:id])
    end

    def debt_params
      params.require(:debt).permit(:person_id, :amount, :observation)
    end
end
