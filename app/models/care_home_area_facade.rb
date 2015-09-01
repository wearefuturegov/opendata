class CareHomeAreaFacade
  def initialize(area)
    @area = area
  end

  def homes
    CareHome.in_area(@area)
  end

  def metrics
    CareHomeMetric
      .joins(:care_home).merge(homes)
      .where(collection_date: most_recent_collection_date)
  end

  def most_recent_collection_date
    CareHomeMetric.maximum(:collection_date)
  end

  def total_homes
    homes.size
  end

  def beds_count
    metrics.sum(:capacity)
  end

  def vacancies_count
    [:residential_vacancies, :nursing_vacancies, :short_stay_vacancies].reduce(0) do |type|
      metrics.sum(type)
    end
  end

  def nursing_homes_beds_count
    metrics.merge(CareHome.where(nursing_care: true)).sum(:capacity)
  end

  def nursing_homes_vacancies
    metrics.merge(CareHome.where(nursing_care: true)).sum(:nursing_vacancies)
  end

  def care_homes_beds_count
    metrics.merge(CareHome.where(residential: true)).sum(:capacity)
  end

  def care_homes_vacancies
    metrics.merge(CareHome.where(residential: true)).sum(:residential_vacancies)
  end

  def homes_with_dementia_care_count
    homes.where(dementia_care: true).size
  end

  def homes_with_dementia_care_beds
    metrics.merge(CareHome.where(dementia_care: true)).sum(:capacity)
  end

  def dementia_only_homes_count
    homes.where(dementia_care: true, all_care: false).size
  end

  def dementia_only_homes_beds
    metrics.merge(CareHome.where(dementia_care: true, all_care: false)).sum(:capacity)
  end
end
