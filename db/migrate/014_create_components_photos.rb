class CreateComponentsPhotos < ActiveRecord::Migration
  def self.up
    create_table :components_photos, :id => false do |t|
      t.integer   :component_id
      t.integer   :photo_id
    end
  end

  def self.down
    drop_table :components_photos
  end
end
