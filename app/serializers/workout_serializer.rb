class WorkoutSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :date, :reps, :sets, :exercise, :weight, :note, :user_id, :client_id

  # belongs_to :user
  # belongs_to :client 

  def date
    self.object.date.strftime("%m/%d/%Y %I:%M%p")
  end

end
