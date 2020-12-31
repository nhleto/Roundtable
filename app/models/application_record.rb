class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def banner
    group_photo.variant(resize: '730x500!')
  end

  def thumbnail
    group_photo.variant(resize: '223x150!')
  end

  def square
    images.variant(resize: '250x250')
  end
end
