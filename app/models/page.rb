class Page < ActiveRecord::Base
  has_many :checklists


  def select_list()
    checklists.map { |checklist| checklist.title }
  end

end
