class Like < ActiveRecord::Base
    belongs_to :user
    belongs_to :finstagram_post
    # For Likes
    validates_presence_of :user, :finstagram_post
end