class Task::Operation::Index < Trailblazer::Operation
  step Policy::Pundit(TaskPolicy, :index?)
  step :model!

  def model!(options, params:, current_user:, **)
    options[:model] = Pundit.policy_scope(current_user, Project.find_by!(id: params[:project_id]).tasks)
  end
end
