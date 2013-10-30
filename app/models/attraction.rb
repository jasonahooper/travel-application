class Attraction < ActiveRecord::Base
  attr_accessible :destination_id, :latitude, :longitude, :name, :image_url

  belongs_to :destination

  validates :name, :presence => :true

  geocoded_by :destination_and_attraction
  after_validation :geocode

  def destination_and_attraction
    "#{destination.name} #{self.name}"
  end
end
