class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction
  validate :bid_must_be_higher_then_current_high
  validate :cant_bid_on_own_auction
  validates :amount, numericality: true

  #validate
  def bid_must_be_higher_then_current_high
    if amount <= auction.current_high_bid
      errors.add(:amount, "can't be lower then the current high bid!")
    end
  end

  def cant_bid_on_own_auction
    if user.id == auction.user_id
      errors.add(:user, "can't bid on your own auction scrub! that is cheating")
    end
  end

end
