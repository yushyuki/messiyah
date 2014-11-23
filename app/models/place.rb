class Place < ActiveRecord::Base
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode
  belongs_to :post, dependent :destroy
end
