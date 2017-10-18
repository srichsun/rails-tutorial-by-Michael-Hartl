class User
  attr_accessor :name, :email

  def initialize(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end
end

# user = User.new
# user.name = "Kevin"
# user.email = "srichsun@gmail.com"
# user.formatted_email
# or
# user = User.new(name: "Kevin", email: "srichsun@gmail.com")
# user.formatted_email
