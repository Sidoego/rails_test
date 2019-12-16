class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  #validates :user_id, presence: true
  validate  :empty_user_validate

private

  def empty_user_validate
    errors.add(:user_id, "You need to sign up to create an article") if user_id.nil?
  end

end
