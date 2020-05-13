module Project::Operation
  class Create < Trailblazer::Operation
    step Policy::Pundit(ProjectPolicy, :create?)
    step Model(Project, :new)
    step Contract::Build(constant: Project::Contract::Base)
    step Contract::Validate()
    step Contract::Persist()
  end
end
