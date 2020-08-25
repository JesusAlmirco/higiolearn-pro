class Project < ApplicationRecord
    #Add friendly_id 
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]
    #tasks association
    has_many :tasks
    #subscriptions association
    has_many :subscriptions
    has_many :users, through: :subscriptions
    
    #review project
    has_many :reviews
    #add image to project
    #has_one_attached :image # disable im,age upload temporary

    #validate project
    validates :name, presence: true, length: { maximum: 100 }
    validates :content, presence: true, length: { maximum: 1000 }
    validates :price, presence: true, numericality: { only_integer: true }

    #Implemnted legth text 
    def shortname
        name.length > 80? name[0..80] + "..." : name
    end

    #implemntas project stars
    def average_rating
        reviews.blank? ? 0 : reviews.average(:star).round(2)
    end
end
