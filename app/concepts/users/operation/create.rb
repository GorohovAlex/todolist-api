class Users::Operation::Create < Trailblazer::Operation
  step :create

  def create(options, params, **)
    model = User.new(params)

    if model.save
      options[:model] = model
    else
      options[:errors] = model.errors
      false
    end
  end
end
