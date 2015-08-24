# == Schema Information
#
# Table name: care_homes
#
#  id                         :integer          not null, primary key
#  area_id                    :integer          not null
#  cqc_location_uid           :string           not null
#  name                       :text             not null
#  town                       :string           not null
#  postcode                   :string           not null
#  nursing_care               :boolean          default(FALSE), not null
#  residential                :boolean          default(FALSE), not null
#  all_care                   :boolean          default(FALSE), not null
#  dementia_care              :boolean          default(FALSE), not null
#  learning_disabilities_care :boolean          default(FALSE), not null
#  mental_health_care         :boolean          default(FALSE), not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_care_homes_on_area_id           (area_id)
#  index_care_homes_on_cqc_location_uid  (cqc_location_uid) UNIQUE
#

class CareHome < ActiveRecord::Base
  belongs_to :area
  has_many :metrics, class_name: "CareHomeMetric"
end
