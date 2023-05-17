class Job < ApplicationRecord
  validates :title, presence:true
  validates :location, presence:true
  validates :company, presence:true
  validates :link, presence:true
  validates :status, presence:true, inclusion: { in: %w[Interested Applied Interviewed Offered Rejected] }

  def has_status?(job_status)
    status == job_status
  end
end