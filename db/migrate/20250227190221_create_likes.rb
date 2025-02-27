class CreateLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :likeable, polymorphic: true
      t.index [ :user_id, :likeable_id ]

      t.timestamps
    end
  end
end
