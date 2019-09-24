class Bug < ApplicationRecord
  validates :title, :bugtype, :status, presence: true
  validates :title, uniqueness: true
  belongs_to :project
  belongs_to :user
  mount_uploader :image, ImageUploader
end
