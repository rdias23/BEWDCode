class Story < ActiveRecord::Base

def self.search_for(query)
  where('title LIKE ? OR category LIKE ?', "%#{query}%", "%#{query}%")
  end
end
