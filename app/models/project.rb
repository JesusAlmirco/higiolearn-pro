class Project < ApplicationRecord
    has_many :tasks

    #validate project
    validates :name, presence: true, length: { maximum: 50 }
    validates :content, presence: true, length: { maximum: 500 }
    validates :price, presence: true, numericality: { only_integer: true }
end
