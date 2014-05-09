class Auction < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  validates :reserve_price, numericality: true

  #get the highest bid amount
  def highest_bid
    list_of_bids = bids.order(amount: :desc)
    if list_of_bids.blank? 
      return 0
    end
    list_of_bids[0].amount
  end

  #this returns the amount the bid where currently be charged 
  #even though it maybe not the highest bid
  def current_high_bid
    list_of_bids = bids.order(amount: :desc)
    if list_of_bids.blank? 
      return 0
    elsif list_of_bids.length == 1
      return 1
    end

    return list_of_bids[1].amount + 1 #add $1 to the 2nd highest bid
  end

end
