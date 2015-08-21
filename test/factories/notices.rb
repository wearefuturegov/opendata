# == Schema Information
#
# Table name: notices
#
#  id         :integer          not null, primary key
#  title      :string
#  link       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :notice do
    title "MyString"
link "MyString"
  end

end
