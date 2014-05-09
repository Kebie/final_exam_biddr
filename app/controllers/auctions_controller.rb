class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy, :new]


  def index
    @auctions = Auction.all
  end

  def show
    @bid = Bid.new
  end

  def new
    @auction = Auction.new
  end
  def edit
  end

  def create
    @auction = current_user.auctions.new(auction_params)

      if @auction.save
        redirect_to @auction, notice: 'Auction was successfully created.'

      else
        render :new
      end
  end

  def update
      if @auction.update(auction_params)
        redirect_to @auction, notice: 'Auction was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /auctions/1
  # DELETE /auctions/1.json
  def destroy
    @auction.destroy
    redirect_to auctions_url, notice: 'Auction was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auction_params
      params.require(:auction).permit(:title, :details, :ends_on, :reserve_price, :user_id)
    end
end
