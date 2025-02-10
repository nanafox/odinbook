class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, null: false, foreign_key: true, index: { unique: true }
      t.string :name
      t.string :username, index: { unique: true }
      t.string :bio

      t.timestamps
    end
  end
end
