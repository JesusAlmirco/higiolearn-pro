class Task < ApplicationRecord
  #Add friendly_id 
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :project

  validates :title, presence: true, length: { maximum: 200 }
  #validates :video, presence: true
  #validates :tag, presence: true
  validates :project, presence: true

  #Implemnted next button
  def next
    project.tasks.where("tag > ? AND header = ?", tag, false).order(:tag).first
  end

  #Implemnted preview button
  def prev
    project.tasks.where("tag < ? AND header = ?", tag, false).order(:tag).last
  end
end
