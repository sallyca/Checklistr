class Page < ActiveRecord::Base
  has_many :checklists

  def initialize()
    checklist=Checklist.new
    checklist.title='Новый список'
    checklists=Array.new
    checklists<<checklist
  end


  def select_list()
    checklists.map { |checklist| checklist.title }
  end

end
