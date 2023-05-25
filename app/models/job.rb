class Job < ApplicationRecord

  STATUSES = %w[Interested Applied Interviewed Offered Rejected]
  validates :title, presence:true
  validates :location, presence:true
  validates :company, presence:true
  validates :link, presence:true
  validates :status, presence:true, inclusion: { in: STATUSES }

  belongs_to :user

  def has_status?(job_status)
    status == job_status
  end

  def self.status_list
    STATUSES
  end
end