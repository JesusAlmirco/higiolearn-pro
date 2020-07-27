class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #Declave Avatar image
  has_one_attached :avatar
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Declarated Fullname register with devise
  validates :fullname, presence: true, length: {maximum: 40}
end
