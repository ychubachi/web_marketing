require 'spec_helper'

describe FormsController do

  # This should return the minimal set of attributes required to create a valid
  # Form. As you add validations to Form, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "address" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FormsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET new" do
    it "renders new template" do
      get :new, {}, valid_session
      response.should render_template('new')
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Customer" do
        expect {
          post :create, {:customer => valid_attributes}, valid_session
        }.to change(Customer, :count).by(1)
      end

      it "redirects to the created customer" do
        post :create, {:customer => valid_attributes}, valid_session
        response.should redirect_to('/form/thank_you')
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved form as @form" do
        # Trigger the behavior that occurs when invalid params are submitted
        Customer.any_instance.stub(:save!).and_raise
        post :create, {:customer => { "address" => "invalid value" }}, valid_session
        assigns(:customer).should be_a_new(Customer)
      end

      it "redirect to /form/sorry" do
        # Trigger the behavior that occurs when invalid params are submitted
        Customer.any_instance.stub(:save!).and_raise
        post :create, {:customer => { "address" => "invalid value" }}, valid_session
        response.should redirect_to('/form/sorry')
      end
    end
  end

end
