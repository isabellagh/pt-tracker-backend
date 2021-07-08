class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :image

  has_many :clients
  has_many :workouts 
end
