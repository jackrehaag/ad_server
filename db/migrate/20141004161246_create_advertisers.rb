class CreateAdvertisers < ActiveRecord::Migration
  def change
    create_table :advertisers do |t|
    	t.string :company
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.string :address
    	t.string :city
    	t.string :postcode
    	t.string :country
    	t.integer :user_id
    	t.index :user_id
      t.timestamps
    end
  end
end
