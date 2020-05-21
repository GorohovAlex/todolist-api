require 'swagger_helper'

RSpec.describe TaskComment do
  let!(:user_create) { create(:user) }
  let(:project_create) { create(:project, user: user_create) }
  let(:task_create) { create(:task, project: project_create) }
  let(:task_id) { task_create.id }

  path '/api/v1/tasks/{task_id}/task_comments' do
    get 'A list of TaskComments' do
      tags 'TaskComments'
      produces 'application/json'
      consumes 'multipart/form-data'
      parameter name: 'Authorization', in: :header, type: :string, required: false
      parameter name: :task_id, in: :path, type: :integer

      response '200', 'A list of TaskComments' do
        let(:Authorization) { authenticated_header(user_create)[:Authorization] }
        schema(JSON.parse(File.read('spec/support/api/v1/schemas/task_comment/index.json')))
        run_test!
      end

      response '401', 'Invalid login credentials' do
        run_test!
      end
    end

    post 'Creates a TaskComment' do
      tags 'TaskComments'
      produces 'application/json'
      consumes 'multipart/form-data'
      parameter name: 'Authorization', in: :header, type: :string, required: false
      parameter name: :task_id, in: :path, type: :integer
      parameter name: :task_comment, in: :formData, required: false,
                schema: {
                  type: :object,
                  properties: {
                    task_comment: {
                      type: :object,
                      properties: {
                        name: { type: :string },
                        image: { type: :binary }
                      }
                    }
                  }
                }

      response '201', 'TaskComment info' do
        let(:Authorization) { authenticated_header(user_create)[:Authorization] }
        let(:task_comment) { attributes_for(:task_comment) }
        schema(JSON.parse(File.read('spec/support/api/v1/schemas/task_comment/create.json')))
        run_test!
      end

      response '401', 'Invalid login credentials' do
        run_test!
      end
    end
  end

  path '/api/v1/task_comments/{id}' do
    let(:task_comment) { create(:task_comment, task: task_create) }
    let(:id) { task_comment.id }

    delete 'Delete the Task' do
      tags 'TaskComments'
      produces 'application/json'
      consumes 'multipart/form-data'
      parameter name: :id, in: :path, type: :integer
      parameter name: 'Authorization', in: :header, type: :string, required: false

      response '204', 'Task deleted' do
        let(:Authorization) { authenticated_header(user_create)[:Authorization] }
        run_test!
      end

      response '401', 'Not authorized' do
        run_test!
      end
    end
  end
end
