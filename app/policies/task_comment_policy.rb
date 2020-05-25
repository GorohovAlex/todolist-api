class TaskCommentPolicy < ApplicationPolicy
  def index?
    true if user.present?
  end

  def create?
    index?
  end

  def destroy?
    index?
  end

  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      scope.joins(task: [:project]).where('projects.user_id=?', user.id)
    end
  end
end
