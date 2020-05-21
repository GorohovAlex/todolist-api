require 'swagger_helper'

RSpec.describe Session do
  let(:user_params) { attributes_for(:user) }
  let!(:user_create) { User.create(user_params) }

  path '/api/v1/auth/sign_in' do
    post 'Sign In' do
      tags 'Authentication'
      produces 'application/json'
      consumes 'multipart/form-data'
      parameter name: :username, in: :formData
      parameter name: :password, in: :formData

      response '200', 'User information' do
        let(:username) { user_params[:username] }
        let(:password) { user_params[:password] }
        schema(JSON.parse(File.read('spec/support/api/v1/schemas/session/create.json')))

        run_test!
      end

      response '401', 'Invalid login credentials' do
        let(:username) { user_create.username }
        let(:password) { '' }
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
