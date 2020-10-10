# frozen_string_literal: true

# Video Post Model
class Video < Post
  validate :video_present
  validate :corret_video_type

  private

  def video_present
    return if video.attached?

    errors.add(:video, "can't be blank")
  end

  def corret_video_type
    return unless video.attached? && !video.content_type.in?(%w(video/*))

    errors.add(:images, 'must be a video file')
  end
end
