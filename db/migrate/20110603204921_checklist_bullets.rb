class ChecklistBullets < ActiveRecord::Migration
  def self.up
    add_column :bullets, :checklist_id, :integer
  end

  def self.down
    remove_column :bullets, :checklist_id, :integer
  end
end
