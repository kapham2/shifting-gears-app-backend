class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.belongs_to :user, foreign_key: true
      t.float :distance
      t.float :time
      t.float :avg_velocity

      t.timestamps
    end
  end
end
