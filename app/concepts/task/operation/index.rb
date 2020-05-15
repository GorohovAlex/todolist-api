class Task::Operation::Index < Trailblazer::Operation
  step Policy::Pundit(TaskPolicy, :index?)
  step :params!
  step :model!

  def params!(_options, params:, **)
    params[:project_id].present?
  end

  def model!(options, params:, current_user:, **)
    options[:model] = Pundit.policy_scope(current_user, Task).where(project_id: params[:project_id])
  end
end
