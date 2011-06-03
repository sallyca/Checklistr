class Page < ActiveRecord::Base
  has_many :checklists


    def select_list()
      checklists.inject( {} ) do | hash, obj |
                        hash.merge({obj.send(:title) => obj })
        end
    end
end
