class TaskComment::Operation::Create < Trailblazer::Operation
  step :model!
  step Policy::Pundit(TaskCommentPolicy, :create?)
  step Contract::Build(constant: TaskComment::Contract::Create)
  step Contract::Validate(key: :task_comment)
  step Contract::Persist()

  def model!(options, params:, **)
    options[:model] = TaskComment.new(task_id: params[:task_id])
  end
end
