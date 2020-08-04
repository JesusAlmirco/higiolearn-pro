class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable, :trackable and :omniauthable

  #Declave Avatar image
  has_one_attached :avatar
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  #Declarated Fullname register with devise
  validates :fullname, presence: true, length: {maximum: 25}
end
