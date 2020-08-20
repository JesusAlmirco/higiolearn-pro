class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :comment
      #t.datetime :created_review disable this funtion beacause used defaul create time review
      t.integer :star

      t.timestamps
    end
  end
end
