module Project::Operation
  class Create < Trailblazer::Operation
    step Policy::Pundit(ProjectPolicy, :create?)
    step :model!
    step Contract::Build(constant: Project::Contract::Base)
    step Contract::Validate(key: :project)
    step Contract::Persist()

    def model!(options, current_user:, **)
      options[:model] = Project.new(user_id: current_user.id)
    end
  end
end
