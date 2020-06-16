require 'swagger_helper'

RSpec.describe Session do
  let(:user_params) { attributes_for(:user) }
  let!(:user_create) { User.create(user_params) }

  path '/api/v1/auth/sign_in' do
    post 'Sign In' do
      tags 'Authentication'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string }
        }
      }

      response '200', 'User information' do
        let(:user) { user_params }
        schema(JSON.parse(File.read('spec/support/api/v1/schemas/session/create.json')))

        run_test!
      end

      response '401', 'Invalid login credentials' do
        let(:user) { user_create }
        run_test!
      end
    end
  end

  path '/api/v1/auth/sign_out' do
    delete 'Sign Out' do
      tags 'Authentication'
      produces 'application/json'
      consumes 'multipart/form-data'
      parameter name: 'Authorization', in: :header, type: :string, required: false

      response '204', ' User sign out' do
        let(:Authorization) { authenticated_header(user_create)[:Authorization] }
        run_test!
      end

      response '401', 'Not authorized' do
        run_test!
      end
    end
  end
end
