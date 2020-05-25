require 'swagger_helper'

RSpec.describe Project do
  let!(:user_create) { create(:user) }

  path '/api/v1/projects' do
    get 'A list of Projects' do
      tags 'Projects'
      produces 'application/json'
      consumes 'multipart/form-data'
      parameter name: 'Authorization', in: :header, type: :string, required: false

      response '200', 'A list of Projects' do
        let(:Authorization) { authenticated_header(user_create)[:Authorization] }
        schema(JSON.parse(File.read('spec/support/api/v1/schemas/project/index.json')))
        run_test!
      end

      response '401', 'Invalid login credentials' do
        let(:username) { user_create.username }
        let(:password) { '' }
        run_test!
      end
    end
  end
end
