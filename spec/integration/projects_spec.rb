require 'swagger_helper'

RSpec.describe Project do
  let!(:user_create) { create(:user) }

  path '/api/v1/projects' do
    get 'A list of Projects' do
      tags 'Projects'
      consumes 'application/json'
      produces 'application/json'
      parameter name: 'Authorization', in: :header, type: :string, required: false

      response '200', 'A list of Projects' do
        let(:Authorization) { authenticated_header(user_create)[:Authorization] }
        schema(JSON.parse(File.read('spec/support/api/v1/schemas/project/index.json')))
        run_test!
      end

      response '401', 'Invalid login credentials' do
        run_test!
      end
    end

    post 'Creates a Project' do
      tags 'Projects'
      consumes 'application/json'
      produces 'application/json'
      parameter name: 'Authorization', in: :header, type: :string, required: false
      parameter name: :project, in: :body, required: false,
                schema: {
                  type: :object,
                  properties: {
                    project: {
                      type: :object,
                      properties: {
                        name: { type: :string }
                      }
                    }
                  }
                }

      response '201', 'Project info' do
        let(:Authorization) { authenticated_header(user_create)[:Authorization] }
        let(:project) { { project: attributes_for(:project) } }
        schema(JSON.parse(File.read('spec/support/api/v1/schemas/project/create.json')))
        run_test!
      end

      response '401', 'Invalid login credentials' do
        run_test!
      end
    end
  end

  path '/api/v1/projects/{id}' do
    let(:project_create) { create(:project, user: user_create) }
    let(:id) { project_create.id }

    put 'Update the Project' do
      tags 'Projects'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: 'Authorization', in: :header, type: :string, required: false
      parameter name: :project, in: :body, required: false,
                schema: {
                  type: :object,
                  properties: {
                    project: {
                      type: :object,
                      properties: {
                        name: { type: :string }
                      }
                    }
                  }
                }

      response '200', 'Project updated' do
        let(:Authorization) { authenticated_header(user_create)[:Authorization] }
        let(:project) { { project: attributes_for(:project) } }
        schema(JSON.parse(File.read('spec/support/api/v1/schemas/project/create.json')))
        run_test!
      end

      response '401', 'Not authorized' do
        run_test!
      end
    end

    delete 'Delete the Project' do
      tags 'Projects'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: 'Authorization', in: :header, type: :string, required: false

      response '204', 'Project deleted' do
        let(:Authorization) { authenticated_header(user_create)[:Authorization] }
        run_test!
      end

      response '401', 'Not authorized' do
        run_test!
      end
    end
  end
end
