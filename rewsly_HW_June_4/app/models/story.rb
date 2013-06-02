class Story < ActiveRecord::Base
  validates :title, :upvotes, presence: true
  validates :link, format: { with: /\A^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix}
  validates :link, uniqueness: true
  has_many :tags
  has_many :categories, through: :tags
  belongs_to :source

  def tag_list
    self.categories.pluck(:name)
  end

  def tag_list=(tags)
      tags = tags.split(/,\s*/)
  
      tags.each do |tag|
        unless self.categories.find_by name: tag
          self.categories << Category.where(name: tag).first_or_create
        end
      end

      self.categories.where.not(name: tags).destroy_all
   end

def self.search_for(query)
  where('title LIKE ?', "%#{query}%")
  end
end
