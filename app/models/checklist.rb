class Checklist < ActiveRecord::Base
   has_many :bullets
   belongs_to :page
end
