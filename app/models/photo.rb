class Photo < ActiveRecord::Base
  mount_uploader :url, ImageUploader # Tells rails to use this uploader for this model.
  belongs_to :gallery

  def url
  	if read_attribute(:url) 
	  read_attribute(:url)
  	elsif self.url_seed
  	  self.url_seed
  	else
  	  nil
	end
  end
end
