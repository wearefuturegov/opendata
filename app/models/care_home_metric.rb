# == Schema Information
#
# Table name: care_home_metrics
#
#  id                    :integer          not null, primary key
#  care_home_id          :integer          not null
#  collection_date       :date
#  capacity              :integer
#  residential_vacancies :integer
#  nursing_vacancies     :integer
#  short_stay_vacancies  :integer
#  vacancy_update_date   :date
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_care_home_metrics_on_care_home_id  (care_home_id)
#

class CareHomeMetric < ActiveRecord::Base
  belongs_to :care_home
end
