# frozen_string_literal: true

# Image Post Model
class Image < Post
  validate :images_present
  validate :corret_images_type

  private

  def images_present
    return if images.attached?

    errors.add(:images, "can't be blank")
  end

  def corret_images_type
    return unless images.attached? && !images.content_type.in?(%w(image/*))

    errors.add(:images, 'must be Image files')
  end
end
