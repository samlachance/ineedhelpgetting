class City < ActiveRecord::Base
  belongs_to :state

  extend FriendlyId
  friendly_id :name, use: :slugged
end
