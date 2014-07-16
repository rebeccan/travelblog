class Gallery < ActiveRecord::Base
  belongs_to :post
  has_many :photos, dependent: :destroy
  
  def self.find_recent
   galleries = Gallery.find(:all, :joins => :post, :order => 'posts.date DESC')
  end
  
  def self.find_recent_not_draftpost_publicjourney
   galleries = Gallery.find(:all, :joins => :post, :order => 'posts.date DESC')
   galleries.each do |gallery|
    if(gallery.post.draft || !gallery.post.journey.public)
      galleries.delete(gallery)
    end
   end
  end
  
  
end
