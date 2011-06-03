class CreateListers < ActiveRecord::Migration
  def self.up
    create_table :listers do |t|
      t.string :email
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :listers
  end
end
