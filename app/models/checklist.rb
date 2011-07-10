class Checklist < ActiveRecord::Base
  has_many :bullets
  belongs_to :page
  
  validate :title, :presence=>true
end
