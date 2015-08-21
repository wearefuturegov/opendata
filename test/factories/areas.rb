# == Schema Information
#
# Table name: areas
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  live       :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :area do
    name "MyString"
  end

end
