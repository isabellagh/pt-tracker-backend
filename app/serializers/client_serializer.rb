class ClientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :age, :gender, :email, :goal, :image, :weight, :height, :waist, :hip, :user_id

  belongs_to :user 
end
