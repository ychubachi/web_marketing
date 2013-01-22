class FormsController < ApplicationController
  # GET /forms/new
  def new
    @form = Customer.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Customer.new(params[:form])

    respond_to do |format|
      if @form.save
        format.html { redirect_to '/form/thank_you'}
      else
        format.html { render action: "new" }
      end
    end
  end
end
