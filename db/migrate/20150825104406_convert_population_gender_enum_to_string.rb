class ConvertPopulationGenderEnumToString < ActiveRecord::Migration
  def up
    change_column :populations, :gender, :string, null: false
    execute "UPDATE populations SET gender = 'male' WHERE gender = '0'"
    execute "UPDATE populations SET gender = 'female' WHERE gender = '1'"
  end

  def down
    execute "UPDATE populations SET gender = '0' WHERE gender = 'male'"
    execute "UPDATE populations SET gender = '1' WHERE gender = 'female'"
    change_column :populations, :gender, :integer, null: false
  end
end
