class Landing::PageController < ApplicationController
  def index
    @customer = Customer.new
  end

  def thank_you
  end

  def sorry
  end

  def create
    browser = get_browser

    @customer = Customer.new(params[:customer])
    @customer.browser = browser

    puts @customer
    if @customer.save
      ConvertionMailer.conversion(@customer).deliver

      redirect_to '/lp/thank_you'
      logger.info 'successfully created.'
    else
      redirect_to '/lp/sorry'
      logger.info 'error'
    end
  end
end
