class TaskCommentPolicy < ApplicationPolicy
  def index?
    record.task.project.user.eql?(user)
  end

  def create?
    index?
  end

  def destroy?
    index?
  end
end
