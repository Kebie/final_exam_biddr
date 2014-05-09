class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :details
      t.datetime :ends_on
      t.float :reserve_price
      t.references :user, index: true

      t.timestamps
    end
  end
end
