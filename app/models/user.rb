class User < ApplicationRecord
  after_create :set_username
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable,
         :confirmable
        #  :omniauthable, omniauth_providers: [:facebook]
private

  def set_username
    email = self.email.split('@').first
    self.update!(username: email)
  end
end
