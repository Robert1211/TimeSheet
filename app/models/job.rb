class Job < ApplicationRecord

  # belongs_to :user, :optional => true
  belongs_to :project, :optional => true


  def duration
    end_time - start_time
  end
end

# Example of duration
# j = Job.first
# j.start_time
# j.end_time
# j.duration
