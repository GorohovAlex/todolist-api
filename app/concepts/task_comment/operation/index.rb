class TaskComment::Operation::Index < Trailblazer::Operation
  step Policy::Pundit(TaskCommentPolicy, :index?)
  pass :task!
  step :task_policy!
  pass :model!

  def task!(options, params:, **)
    options[:task] = Task.find_by!(id: params[:task_id])
  end

  def task_policy!(_options, current_user:, task:, **)
    TaskPolicy.new(current_user, task).show?
  end

  def model!(options, task:, current_user:, **)
    options[:model] = Pundit.policy_scope(current_user, task.task_comments)
  end
end
