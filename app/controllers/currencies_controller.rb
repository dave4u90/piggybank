class CurrenciesController < ApplicationController
  def index
    @currencies = Currency.includes(:prices)
  end

  def show
    @currency = Currency.find_by(id: params[:id])
    @prices = @currency ? @currency.prices.order(created_at: :desc).paginate(page: params[:page], per_page: 5) : []
  end

  def capture
    if Price.capture!
      redirect_to root_path, notice: t('currencies.captured')
    else
      redirect_to root_path, flash: { error: t('currencies.capture_error') }
    end
  end

  def chart_data
    currency = Currency.find_by(id: params[:id])
    
    render json: currency.prices.group(:current_time).maximum(:last)
  end
end
