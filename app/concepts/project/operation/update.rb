module Project::Operation
  class Update < Trailblazer::Operation
    step Model(Project, :find)
    step Policy::Pundit(ProjectPolicy, :update?)
    step Contract::Build(constant: Project::Contract::Base)
    step Contract::Validate(key: :project)
    step Contract::Persist()
  end
end
