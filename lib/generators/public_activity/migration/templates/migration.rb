# Migration responsible for creating a table with activities
class Create<%= model_name.classify.pluralize %> < ActiveRecord::Migration
  # Create table
  def self.up
    create_table :<%= model_name.tableize %> do |t|
      t.belongs_to :trackable, :polymorphic => true
      t.belongs_to :owner, :polymorphic => true
      t.string  :key
      t.text    :parameters
      t.belongs_to :recipient, :polymorphic => true

      t.timestamps
    end

    add_index :<%= model_name.tableize %>, [:trackable_id, :trackable_type]
    add_index :<%= model_name.tableize %>, [:owner_id, :owner_type]
    add_index :<%= model_name.tableize %>, [:recipient_id, :recipient_type]
  end
  # Drop table
  def self.down
    drop_table :<%= model_name.tableize %>
  end
end
