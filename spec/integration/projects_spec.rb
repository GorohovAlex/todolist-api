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

  # path '/api/v1/auth/sign_out' do
  #   delete 'Sign Out' do
  #     tags 'Authentication'
  #     produces 'application/json'
  #     consumes 'multipart/form-data'
  #     parameter name: 'Authorization', in: :header, type: :string, required: false

  #     response '204', ' User sign out' do
  #       let(:Authorization) { authenticated_header(user_create)[:Authorization] }
  #       run_test!
  #     end

  #     response '401', 'Not authorized' do
  #       run_test!
  #     end
  #   end
  # end
end
