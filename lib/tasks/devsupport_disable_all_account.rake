namespace :devsupport do
  desc "Disable every users accounts except admins and staff"
  task deactivate: :environment do
    User.find_each do |user|
      if !user.admin? && !user.staff?
        begin
          user.active = false
          user.save!
          puts "User #{user.username} has been deactivated."
        rescue => e
          puts "Error deactivating user #{user.username}: #{e.message}"
        end
      end
    end
  end
end
