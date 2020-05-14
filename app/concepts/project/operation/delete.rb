module Project::Operation
  class Delete < Trailblazer::Operation
    step :model!
    step Policy::Pundit(ProjectPolicy, :destroy?)
    pass :delete!

    def model!(options, params:, current_user:, **)
      options[:model] = Pundit.policy_scope(current_user, Project).find_by(id: params[:id])
    end

    def delete!(_options, model:, **)
      Project.destroy(model.id)
    end
  end
end
