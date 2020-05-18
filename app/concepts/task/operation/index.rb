class Task::Operation::Index < Trailblazer::Operation
  step Policy::Pundit(TaskPolicy, :index?)
  step :params!
  fail :params_error!
  step :model!

  def params!(_options, params:, **)
    params[:project_id].present? && params[:project_id].to_i.positive?
  end

  def params_error!(options, **)
    options[:errors] = { project_id: I18n.t('errors.invalid_project_id') }
  end

  def model!(options, params:, current_user:, **)
    options[:model] = Pundit.policy_scope(current_user, Task).where(project_id: params[:project_id])
  end
end
