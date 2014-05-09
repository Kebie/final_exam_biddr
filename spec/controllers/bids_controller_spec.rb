require 'spec_helper'

describe BidsController do

  let(:auction) {create(:auction)}

  let(:valid_attributes) { FactoryGirl.attributes_for(:bid) }

  let(:valid_session) { sign_in create(:user) }


  describe "POST create" do
    describe "with valid params" do
      it "creates a new Bid" do
        expect {
          post :create, {auction_id: auction.id, :bid => valid_attributes}, valid_session
        }.to change(Bid, :count).by(1)
      end

      it "redirects to the appropriate auction" do
        post :create, {auction_id: auction.id, :bid => valid_attributes}, valid_session
        response.should redirect_to([Bid.last.auction])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bid as @bid" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bid.any_instance.stub(:save).and_return(false)
        post :create, {auction_id: auction.id, :bid => { "auction" => "invalid value" }}, valid_session
        assigns(:bid).should be_a_new(Bid)
      end

      it "re-renders the auction" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bid.any_instance.stub(:save).and_return(false)
        post :create, {auction_id: auction.id, :bid => { "auction" => "invalid value" }}, valid_session
        response.should render_template("auctions/show")
      end
    end
  end

end
