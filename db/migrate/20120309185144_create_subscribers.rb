class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :name
      t.string :ip
      t.string :country_code
      t.datetime :unsubscribed_at

      t.timestamps
    end
  end
end
