namespace :devsupport do
  desc "Send an activation email to all inactive users"
  task send_activation_email: :environment do
    User.where(active: false).find_each do |user|
      if !user.admin? && !user.staff?
        begin
          email_token = user.email_tokens.create(email: user.email)
          Jobs.enqueue(:critical_user_email, type: :signup, user_id: user.id, email_token: email_token.token)
          puts "Sent activation email to user #{user.username}"
        rescue => e
          puts "Error sending activation email to user #{user.username}: #{e.message}"
        end
      end
    end
  end
end
