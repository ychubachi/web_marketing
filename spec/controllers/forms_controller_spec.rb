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
  
  describe "GET index", 'is not in use' do
    it "assigns all forms as @forms" do
      expect {
        get :index, {}, valid_session
      }.to raise_error(ActionController::RoutingError)
    end
  end

  describe "GET show", 'is not in use' do
    it "assigns the requested form as @form" do
      expect {
        get :show, {}, valid_session
      }.to raise_error(ActionController::RoutingError)
    end
  end

  describe "GET new" do
    it "assigns a new form as @form" do
      get :new, {}, valid_session
      assigns(:form).should be_a_new(Form)
    end
  end

  describe "GET edit" do
    it "assigns the requested form as @form" do
      expect {
        get :edit, {}, valid_session
      }.to raise_error(ActionController::RoutingError)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Form" do
        expect {
          post :create, {:form => valid_attributes}, valid_session
        }.to change(Form, :count).by(1)
      end

      it "assigns a newly created form as @form" do
        post :create, {:form => valid_attributes}, valid_session
        assigns(:form).should be_a(Form)
        assigns(:form).should be_persisted
      end

      it "redirects to the created form" do
        post :create, {:form => valid_attributes}, valid_session
        response.should redirect_to('/form/thank_you')
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved form as @form" do
        # Trigger the behavior that occurs when invalid params are submitted
        Form.any_instance.stub(:save!).and_raise
        post :create, {:form => { "address" => "invalid value" }}, valid_session
        assigns(:form).should be_a_new(Form)
      end

      it "redirect to /form/sorry" do
        # Trigger the behavior that occurs when invalid params are submitted
        Form.any_instance.stub(:save!).and_raise
        post :create, {:form => { "address" => "invalid value" }}, valid_session
        response.should redirect_to('/form/sorry')
      end
    end
  end

  describe "PUT update", 'is not in use' do
    describe "with valid params" do
      it "updates the requested form" do
        expect {
          put :update, {}, valid_session
        }.to raise_error(ActionController::RoutingError)
      end
    end
  end

  describe "DELETE destroy", 'is not in use' do
    it "destroys the requested form" do
      expect {
        delete :destroy, {}, valid_session
      }.to raise_error(ActionController::RoutingError)
    end
  end

end
