class AddJourneyRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :journey, index: true
  end
end
