class KicadProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :path, :string
  end

  def self.down
  end
end
