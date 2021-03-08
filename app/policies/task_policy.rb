class TaskPolicy < ApplicationPolicy
  def index?
    true if user.present?
  end

  def create?
    user.present?
  end

  def update?
    record.project.user.eql?(user)
  end

  def destroy?
    update?
  end

  def show?
    update?
  end

  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      scope.joins(:project).where('projects.user_id=?', user.id)
    end
  end
end
