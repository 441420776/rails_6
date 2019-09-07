class Package < ApplicationRecord
  has_one_attached :file

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :file, presence: true
end
