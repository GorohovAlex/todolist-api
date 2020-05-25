require 'swagger_helper'

RSpec.describe User do
  path '/api/v1/auth' do
    post 'Registration' do
      tags 'Authentication'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body,
                schema: {
                  type: :object,
                  properties: {
                    user: {
                      type: :object,
                      properties: {
                        username: { type: :string },
                        password: { type: :string },
                        password_confirmation: { type: :string }
                      }
                    }
                  }
                }

      response '201', :created do
        let(:user) { { user: attributes_for(:user) } }
        schema(JSON.parse(File.read('spec/support/api/v1/schemas/user/create.json')))

        run_test!
      end

      response '422', 'Invalid request' do
        let(:user) { { user: attributes_for(:user, username: '') } }
        run_test!
      end
    end
  end
end
