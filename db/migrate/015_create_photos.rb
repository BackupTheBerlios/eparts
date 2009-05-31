class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string    :name, :limit => 30
      t.binary    :data, :limit => 2.megabytes
      t.string    :format, :limit => 20
      t.integer   :x
      t.integer   :y

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
