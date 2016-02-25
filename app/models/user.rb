class User < ActiveRecord::Base
  acts_as_authentic do |c|
    # AuthLogic ignores blank password and password confirmation
    # by default if record exists, change password wouldn't work without this
    c.ignore_blank_passwords = false
  end
  attr_accessor :current_password

  ROLES = %i[prvi_koraci koraci moderator admin superadmin ]

  def self.find_by_username_or_email(login)
    User.find_by_username(login) || User.find_by_email(login)
  end

  def deliver_welcome_email!
    SendWelcomeEmailJob.perform_later(self.id)
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    SendPasswordResetMailJob.perform_later(self.id)
  end

  def deliver_verification_instructions!
    reset_perishable_token!
    SendVerificationInstructionsJob.perform_later(self.id)
  end

  def verify!
    self.verified = true
    self.save
  end

  def base_role?
    ROLES[0..1].include? role_sym
  end

  def higher_role?
    ROLES[2..4].include? role_sym
  end

  def role?(base_role)
    User::ROLES.index(base_role) <= User::ROLES.index(role_sym)
  end

  def role_sym
    role.to_sym
  end
end
