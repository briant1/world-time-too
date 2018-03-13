class City < ApplicationRecord
  belongs_to :country
  has_many :favorites
  attr_accessor :current_time
  scope :popular, ->{ joins(:favorites)
                          .select("cities.*, COUNT(favorites.city_id) as count")
                          .group("cities.id")
                          .order("count desc")
                          .limit(5)
                          }

  def name
    if self.state
      "#{self.city}, #{self.state}"
    else
      self.city
    end
  end

end
