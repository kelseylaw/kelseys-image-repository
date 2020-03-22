class Image < ApplicationRecord
  belongs_to :user
  has_one_attached :picture

  def get_picture_path
    ActiveStorage::Blob.service.path_for(picture.key)
  end
end
