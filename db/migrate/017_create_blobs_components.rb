class CreateBlobsComponents < ActiveRecord::Migration
  def self.up
    create_table :blobs_components, :id => false do |t|
      t.integer   :component_id
      t.integer   :blob_id
    end
  end

  def self.down
    drop_table :blobs_components
  end
end
