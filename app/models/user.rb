class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments , dependent: :destroy
  has_one_attached :avatar
#naresh@anviam.com -> self.email.split('@') -> ["naresh", "anviam.com"] -> [0] -> "naresh".capitalize -> "Naresh"
  
def comment_created
  #this is same as num_comments+=1
  self.number_of_comments = number_of_comments + 1
  save
  number_of_comments
end



def username
    return email.split("@")[0].capitalize
  end
end
