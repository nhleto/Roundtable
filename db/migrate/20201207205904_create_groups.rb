class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :membership_id

      t.timestamps
    end
  end
end
