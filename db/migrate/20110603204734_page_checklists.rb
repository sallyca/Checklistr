class PageChecklists < ActiveRecord::Migration
  def self.up
    add_column :checklists, :page_id, :integer
  end

  def self.down
    remove_column :checklists, :page_id, :integer
  end
end
