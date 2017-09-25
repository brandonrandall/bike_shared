class Station < ActiveRecord::Base

  # validates :name, :dock_count, :city, :installation_date, presence: true

  validates :name, presence: true
  validates :dock_count, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true

end
