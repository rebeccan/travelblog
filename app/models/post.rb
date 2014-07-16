class Post < ActiveRecord::Base
  belongs_to :journey
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :galleries, dependent: :destroy
	has_many :routes, as: :route_able, dependent: :destroy
	
	validates :title, :date, :journey_id, presence: true
  validates :title, length: { minimum: 2 }
	
	
	def self.find_recent(journey_id)
	 journey = Journey.find(journey_id)
	 posts = journey.posts
   posts = posts.sort_by{|e| e[:date]}.reverse
  end
  
  def self.find_recent_not_draft(journey_id)
   posts = Post.where(draft: false, journey_id: journey_id)
   posts = posts.sort_by{|e| e[:date]}.reverse
  end
    
end
