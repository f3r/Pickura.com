class CreateCustomCovers < ActiveRecord::Migration
  def change
    create_table :custom_covers do |t|
      t.string :source
      t.references :user

      t.timestamps
    end
  end
end
