class CreateBlobs < ActiveRecord::Migration
  def self.up
    create_table  :blobs do |t|
      t.string    :name, :limit => 30
      t.binary    :data, :limit => 7.megabytes
      t.string    :format, :limit => 20

      t.timestamps
    end
  end

  def self.down
    drop_table :blobs
  end
end
