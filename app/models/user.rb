class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable, :trackable,
         :recoverable, :rememberable, :validatable,
          :authentication_keys => [:phone_number]
  validates :phone_number, presence: true, uniqueness: true
  protected
  def email_required?
    false
  end
end
