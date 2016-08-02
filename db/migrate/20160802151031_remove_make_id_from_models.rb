class RemoveMakeIdFromModels < ActiveRecord::Migration
  def change
    remove_column :models, :make_id, :integer
  end
end
