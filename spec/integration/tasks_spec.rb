require 'swagger_helper'

RSpec.describe Task do
  let!(:user_create) { create(:user) }
  let(:project_create) { create(:project, user: user_create) }
  let(:project_id) { project_create.id }

  path '/api/v1/projects/{project_id}/tasks' do
    get 'A list of Tasks' do
      tags 'Tasks'
      consumes 'application/json'
      produces 'application/json'
      parameter name: 'Authorization', in: :header, type: :string, required: false
      parameter name: :project_id, in: :path, type: :integer

      response '200', 'A list of Tasks' do
        let(:Authorization) { authenticated_header(user_create)[:Authorization] }
        schema(JSON.parse(File.read('spec/support/api/v1/schemas/task/index.json')))
        run_test!
      end

      response '401', 'Invalid login credentials' do
        run_test!
      end
    end

    post 'Creates a Task' do
      tags 'Tasks'
      consumes 'application/json'
      produces 'application/json'
      parameter name: 'Authorization', in: :header, type: :string, required: false
      parameter name: :project_id, in: :path, type: :integer
      parameter name: :task, in: :body, required: false,
                schema: {
                  type: :object,
                  properties: {
                    task: {
                      type: :object,
                      properties: {
                        name: { type: :string },
                        state: { type: :boolean, required: false },
                        deadline: { type: :string, format: 'date-time', required: false }
                      }
                    }
                  }
                }

      response '201', 'Task info' do
        let(:Authorization) { authenticated_header(user_create)[:Authorization] }
        let(:task) { { task: attributes_for(:task) } }
        schema(JSON.parse(File.read('spec/support/api/v1/schemas/task/create.json')))
        run_test!
      end

      response '401', 'Invalid login credentials' do
        run_test!
      end
    end
  end

  path '/api/v1/tasks/{id}' do
    let(:project_create) { create(:project, user: user_create) }
    let(:task_create) { create(:task, project: project_create) }
    let(:id) { task_create.id }

    put 'Update the Task' do
      tags 'Tasks'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: 'Authorization', in: :header, type: :string, required: false
      parameter name: :task, in: :body, required: false,
                schema: {
                  type: :object,
                  properties: {
                    task: {
                      type: :object,
                      properties: {
                        name: { type: :string },
                        state: { type: :boolean, required: false },
                        deadline: { type: :string, format: 'date-time', required: false }
                      }
                    }
                  }
                }

      response '200', 'Task updated' do
        let(:Authorization) { authenticated_header(user_create)[:Authorization] }
        let(:task) { { task: attributes_for(:task) } }
        schema(JSON.parse(File.read('spec/support/api/v1/schemas/task/create.json')))
        run_test!
      end

      response '401', 'Not authorized' do
        run_test!
      end
    end

    delete 'Delete the Task' do
      tags 'Tasks'
      consumes 'application/json'
      produces 'application/json'
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
