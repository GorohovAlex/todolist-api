class Task::Operation::Index < Trailblazer::Operation
  pass :project!
  step :project_policy!
  pass :model!

  def project!(options, params:, **)
    options[:project] = Project.find_by!(id: params[:project_id])
  end

  def project_policy!(_options, current_user:, project:, **)
    ProjectPolicy.new(current_user, project).show?
  end

  def model!(options, project:, **)
    options[:model] = project.tasks
  end
end
