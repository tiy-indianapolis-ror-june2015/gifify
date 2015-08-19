class UserSession < Authlogic::Session::Base

  def self.validators_on(arg)
    []
  end

end
