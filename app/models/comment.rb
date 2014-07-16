class Comment < ActiveRecord::Base
  belongs_to :post
  
  validates :body, length: { minimum: 2 }
  validates :author, length: {in: 2..200}
  validates :body, :author, presence: true
  
  def self.find_recent(post_id)
   post = Post.find(post_id)
   comments = post.comments
   comments = comments.sort_by{|e| e[:updated_at]}.reverse
   return comments
  end
  
end
