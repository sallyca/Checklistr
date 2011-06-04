class PageNewBullet < ActiveRecord::Migration
  def self.up
      add_column :pages, :new_bullet, :text
  end

  def self.down
     remove_column :pages, :new_bullet, :text
  end
end
