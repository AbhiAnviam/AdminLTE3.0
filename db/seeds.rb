ActiveRecord::Base.logger = Logger.new(STDOUT)
class SeedMethods
  def self.createUser(hashObj, role)
    if !User.where(email: hashObj[:email]).present?
      user = User.find_or_initialize_by(hashObj)
      user.password = "password"
      user.role_id = Role.find_by(name: role).try(:id)
      # user.confirmed_at = Time.now # Not using confirmable right now
      user.save
    end
  end
end
# Create roles
ROLES = { 
"User" => {
    description: "User is someone who will use the app"
  },
"Super Admin" => {
  description: "Super Admin is only one user and can do any action on app."
}
}
ROLES.each do |role, attributes|
  record = Role.find_or_create_by(name: role)
  record.update(attributes)# unless record.default_permissions.as_json == role[:default_permissions].as_json
end

# Create default Admin User, please change these on production
SeedMethods.createUser({email: "superadmin@anviam.com"}, "Super Admin")