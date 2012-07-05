class Landing::PageController < ApplicationController
  def index
    @customer = Customer.new
  end

  def thank_you
  end

  def sorry
  end

  def create
    @customer = Customer.new(params[:customer])
    puts @customer
    if @customer.save
      render action: 'thank_you'
      puts 'successfully created.'
    else
      render action: 'sorry'
      puts 'error'
    end
  end
end
