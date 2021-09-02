class CreateOenologistscores < ActiveRecord::Migration[5.2]
  def change
    create_table :oenologist_scores do |t|
      t.references :wine, foreign_key: true
      t.references :oenologist, foreign_key: true
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
