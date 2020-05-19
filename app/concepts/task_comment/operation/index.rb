class TaskComment::Operation::Index < Trailblazer::Operation
  step Policy::Pundit(TaskPolicy, :index?)
  step :params!
  fail :params_error!
  step :model!

  def params!(_options, params:, **)
    params[:task_id].present? && params[:task_id].to_i.positive?
  end

  def params_error!(options, **)
    options[:errors] = { project_id: I18n.t('errors.invalid_task_id') }
  end

  def model!(options, params:, current_user:, **)
    options[:model] = Pundit.policy_scope(current_user, Task).find_by!(id: params[:task_id]).task_comments
  end
end
