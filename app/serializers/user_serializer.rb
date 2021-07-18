class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :image
   has_many :clients

  # attribute :clients do |user|
  #   user.clients.map do |c|
  #     {
  #       name: c.name,
  #       gender: c.gender,
  #       email: c.email
  #     }
  #   end
  # end

  
end
