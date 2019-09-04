class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable, :trackable,
         :recoverable, :rememberable, :validatable,
          :authentication_keys => [:phone_number]
  validates :phone_number, presence: true, uniqueness: true

  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  protected
  def email_required?
    false
  end


  def self.find_for_database_authentication(conditions={})
    if conditions[:phone_number].present?
      find_by(phone_number: conditions[:phone_number].to_s.downcase)
    else
      nil
    end
  end
end
