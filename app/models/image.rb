class Image < ApplicationRecord
  belongs_to :user
  has_one_attached :picture

  scope :filter_public, -> { where public: true }
  scope :filter_title, -> (title) { where "title like ?", "%#{title}%" }
  scope :filter_description, -> (description) { where "description like ?", "%#{description}%" }
  scope :filter_user, -> (username) { where user_id: User.find_by(username: username)&.id }

  # Returns the absolute path of the picture file in storage associated with the Image record
  def get_picture_path
    ActiveStorage::Blob.service.path_for(picture.key)
  end
end
