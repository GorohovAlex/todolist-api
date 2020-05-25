class Task::Operation::Create < Trailblazer::Operation
  step Policy::Pundit(TaskPolicy, :create?)
  step :model!
  step Contract::Build(constant: Task::Contract::Create)
  step Contract::Validate(key: :task)
  step Contract::Persist()

  def model!(options, params:, **)
    options[:model] = Task.new(project_id: params[:project_id])
  end
end
