class TasksController < ApplicationController
  before_action :authorize_access_request!

  def index
    result = Task::Operation::Create.call(params: params, current_user: current_user)

    if result.success?
      render json: serialize_models(result[:model]), status: :ok
    else
      render json: serialize_errors(result[:model].errors.messages), status: :unprocessable_entity
    end
  end
   
  def create
    
  end
   
  def update
    
  end 
  
  def destroy
    
  end
end
