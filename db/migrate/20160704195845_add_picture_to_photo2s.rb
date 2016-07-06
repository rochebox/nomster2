class AddPictureToPhoto2s < ActiveRecord::Migration
  def change
    add_column :photo2s, :picture, :string
  end
end
