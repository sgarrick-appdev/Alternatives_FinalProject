desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  require 'faker'
  names = ["Dylan", "Emily", "Sofia", "Cayla", "Fin", "Anna"]
  emails = ["dylan@gmail.com", "emily@gmail.com", "cayla@gmail.com", "fin@gmail.com", "anna@gmail.com"]

 6.times do |count|
    user = User.new
    user.username = names.at(count)
    user.email = emails.at(count)
    user.password = "my_password"
    user.save
 end

end
