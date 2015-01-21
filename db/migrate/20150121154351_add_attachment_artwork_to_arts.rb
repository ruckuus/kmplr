class AddAttachmentArtworkToArts < ActiveRecord::Migration
  def self.up
    change_table :arts do |t|
      t.attachment :artwork
    end
  end

  def self.down
    remove_attachment :arts, :artwork
  end
end
