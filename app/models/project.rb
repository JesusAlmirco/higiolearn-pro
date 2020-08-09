class Project < ApplicationRecord
    #Add friendly_id 
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]

    has_many :tasks
    #add image to project
    has_one_attached :image

    #validate project
    validates :name, presence: true, length: { maximum: 100 }
    validates :content, presence: true, length: { maximum: 1000 }
    validates :price, presence: true, numericality: { only_integer: true }
end
