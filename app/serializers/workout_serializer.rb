class WorkoutSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :date, :reps, :sets, :exercise, :weight, :note, :user_id, :client_id

  belongs_to :user
  belongs_to :client 
end
