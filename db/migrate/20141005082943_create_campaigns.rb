class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
    	t.string :name
    	t.money :budget
    	t.date :start_date
    	t.date :end_date
    	t.boolean :in_pause, default: false
    	t.string :link
    	t.string :country
    	t.attachment :creative
    	t.integer :advertiser_id
    	t.index :advertiser_id
      t.timestamps
    end
  end
end
