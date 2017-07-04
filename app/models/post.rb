class Post < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  #validations
  validates :content, presence: true, length: {minimum: 2}

  after_create_commit { PostBroadcastJob.perform_later(self) }
end
