class Micropost < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites,  dependent: :destroy
  has_many :like_users, through: :favorites, source: :user
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :picture, presence: true
  validate  :picture_size
  
  def self.search(search)
    if search
      where(['content LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
