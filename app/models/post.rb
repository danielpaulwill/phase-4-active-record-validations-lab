class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title_is_click_bait

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

  def title_is_click_bait
    if CLICKBAIT_PATTERNS.none? {|pat| pat.match title}
      errors.add(:title, "Not click bait-y enough!")
    end
  end
  
end
