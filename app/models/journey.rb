class Journey < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :routes, as: :route_able, dependent: :destroy
	
	validates :title, :start, :end, :marker_color, presence: true
  validates :marker_color, format: { with: /\h/, message: "is not a valid Hex" }
	validates :title, length: { minimum: 2 }
	
	
	def self.find_recent
    journeys = all( :order => "start DESC")
  end
  
  def self.find_recent_public
   journeys = Journey.where(public: true)
   journeys = journeys.sort_by{|e| e[:start]}.reverse
  end

end
