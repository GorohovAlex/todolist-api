class ProjectPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    true if user.present? && user == record.user
  end

  def destroy?
    update?
  end
end
