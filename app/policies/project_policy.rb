class ProjectPolicy < ApplicationPolicy
  def index?
    true if user.present?
  end

  def create?
    user.present?
  end

  def update?
    record.user.eql?(user)
  end

  def show?
    record.user.eql?(user)
  end

  def destroy?
    update?
  end

  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      scope.where(user: user)
    end
  end
end
