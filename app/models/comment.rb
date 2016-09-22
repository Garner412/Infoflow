class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :votes, as: :voteable

  validates :title, presence: true
end
