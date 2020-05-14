module Project::Operation
  class Delete < Trailblazer::Operation
    step Policy::Pundit(ProjectPolicy, :destroy?)
    step :model!
    step :delete!

    def model!(options, current_user:, id:, **)
      options[:model] = Pundit.policy_scope(current_user, Project.find_by(id))
    end

    def delete!(_options, model:, **)
      Project.destroy(model.id)
    end
  end
end
