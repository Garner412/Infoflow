class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :commentable, as: :comments
  has_many :votes, as: :voteable
end
