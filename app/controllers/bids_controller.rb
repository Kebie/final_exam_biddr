class BidsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy, :new]


  def create
    @auction = Auction.find(params[:auction_id])
    @bid = current_user.bids.new(bid_params)
    @bid.auction_id = @auction.id
    if @bid.save
      redirect_to @auction, notice: "Bid added!"
    else
      @bids = @auction.bids
      render "/auctions/show"
    end
  end


  private

  def bid_params
    params.require(:bid).permit(:amount, :auction_id, :user_id)
  end

end
