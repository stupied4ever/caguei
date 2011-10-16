class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :user_from_id
      t.string :user_to_id
      t.string :user_name
      t.string :to_id

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
