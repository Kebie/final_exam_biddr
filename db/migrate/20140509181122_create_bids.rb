class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :amount
      t.references :user, index: true
      t.references :auction, index: true

      t.timestamps
    end
  end
end
