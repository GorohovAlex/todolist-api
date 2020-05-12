class UserPolicy < ApplicationPolicy
  def create?
    user.nil?
  end
end
