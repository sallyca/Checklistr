class CreateBullets < ActiveRecord::Migration
  def self.up
    create_table :bullets do |t|
      t.boolean :ready
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :bullets
  end
end
