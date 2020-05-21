class TaskComment::Operation::Index < Trailblazer::Operation
  step :model!
  step Policy::Pundit(TaskPolicy, :index?)
  def model!(options, params:, current_user:, **)
    options[:model] = Pundit.policy_scope(current_user, Task.find_by!(id: params[:task_id]).task_comments)
  end
end
