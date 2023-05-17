class Job < ApplicationRecord
  validates :title, presence:true
  validates :location, presence:true
  validates :company, presence:true
  validates :link, presence:true
  validates :status, presence:true
  def has_status?(job_status)
    status == job_status
  end
end
