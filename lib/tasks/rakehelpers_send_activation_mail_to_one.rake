# frozen_string_literal: true
namespace :rakehelpers do
  desc "Send an activation email to a specific inactive user : USERNAME=username"
  task send_activation_email: :environment do
    username = ENV['USERNAME']
    user = User.find_by(username: username)

    if user.nil?
      puts "User not found"
      exit
    end

    if user.active || user.admin? || user.staff?
      puts "User is either active, admin or staff. No activation email sent."
      exit
    end

    begin
      email_token = user.email_tokens.create(email: user.email)
      Jobs.enqueue(:critical_user_email, type: :signup, user_id: user.id, email_token: email_token.token)
      puts "Sent activation email to user #{user.username}"
    rescue => e
      puts "Error sending activation email to user #{user.username}: #{e.message}"
    end
  end
end
