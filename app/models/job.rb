class Job < ApplicationRecord
  def duration
    end_time - start_time
  end
end

# Example of duration
# j = Job.first
# j.start_time
# j.end_time
# j.duration
