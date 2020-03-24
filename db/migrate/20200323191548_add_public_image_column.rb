class AddPublicImageColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :public, :boolean
  end
end
