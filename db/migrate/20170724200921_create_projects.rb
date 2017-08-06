class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :github
      t.string :url
      t.string :youtube
      t.string :duration
      t.string :dojo_location
      t.text :description
      t.string :embed
      t.string :video_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
