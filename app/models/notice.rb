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

class Notice < ActiveRecord::Base

  belongs_to :audience

end
