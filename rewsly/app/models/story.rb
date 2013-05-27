class Story < ActiveRecord::Base
  validates :title, :category, :upvotes, presence: true
  validates :link, format: { with: /\A^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix}
  validates :link, uniqueness: true


def self.search_for(query)
  where('title LIKE ? OR category LIKE ?', "%#{query}%", "%#{query}%")
  end
end
