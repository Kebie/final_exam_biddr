require 'spec_helper'



describe AuctionsController do

  # This should return the minimal set of attributes required to create a valid
  # Auction. As you add validations to Auction, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.attributes_for(:auction) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AuctionsController. Be sure to keep this updated too.
  let(:valid_session) { sign_in create(:user)  }

  describe "GET index" do
    it "assigns all auctions as @auctions" do
      auction = Auction.create! valid_attributes
      get :index, {}, valid_session
      assigns(:auctions).should eq([auction])
    end
  end

  describe "GET show" do
    it "assigns the requested auction as @auction" do
      auction = Auction.create! valid_attributes
      get :show, {:id => auction.to_param}, valid_session
      assigns(:auction).should eq(auction)
    end
  end

  describe "GET new" do
    it "assigns a new auction as @auction" do
      get :new, {}, valid_session
      assigns(:auction).should be_a_new(Auction)
    end
  end

  describe "GET edit" do
    it "assigns the requested auction as @auction" do
      auction = Auction.create! valid_attributes
      get :edit, {:id => auction.to_param}, valid_session
      assigns(:auction).should eq(auction)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Auction" do
        expect {
          post :create, {:auction => valid_attributes}, valid_session
        }.to change(Auction, :count).by(1)
      end

      it "assigns a newly created auction as @auction" do
        post :create, {:auction => valid_attributes}, valid_session
        assigns(:auction).should be_a(Auction)
        assigns(:auction).should be_persisted
      end

      it "redirects to the created auction" do
        post :create, {:auction => valid_attributes}, valid_session
        response.should redirect_to(Auction.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved auction as @auction" do
        # Trigger the behavior that occurs when invalid params are submitted
        Auction.any_instance.stub(:save).and_return(false)
        post :create, {:auction => { "title" => "invalid value" }}, valid_session
        assigns(:auction).should be_a_new(Auction)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Auction.any_instance.stub(:save).and_return(false)
        post :create, {:auction => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested auction" do
        auction = Auction.create! valid_attributes
        # Assuming there are no other auctions in the database, this
        # specifies that the Auction created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Auction.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => auction.to_param, :auction => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested auction as @auction" do
        auction = Auction.create! valid_attributes
        put :update, {:id => auction.to_param, :auction => valid_attributes}, valid_session
        assigns(:auction).should eq(auction)
      end

      it "redirects to the auction" do
        auction = Auction.create! valid_attributes
        put :update, {:id => auction.to_param, :auction => valid_attributes}, valid_session
        response.should redirect_to(auction)
      end
    end

    describe "with invalid params" do
      it "assigns the auction as @auction" do
        auction = Auction.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Auction.any_instance.stub(:save).and_return(false)
        put :update, {:id => auction.to_param, :auction => { "title" => "invalid value" }}, valid_session
        assigns(:auction).should eq(auction)
      end

      it "re-renders the 'edit' template" do
        auction = Auction.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Auction.any_instance.stub(:save).and_return(false)
        put :update, {:id => auction.to_param, :auction => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested auction" do
      auction = Auction.create! valid_attributes
      expect {
        delete :destroy, {:id => auction.to_param}, valid_session
      }.to change(Auction, :count).by(-1)
    end

    it "redirects to the auctions list" do
      auction = Auction.create! valid_attributes
      delete :destroy, {:id => auction.to_param}, valid_session
      response.should redirect_to(auctions_url)
    end
  end

end
