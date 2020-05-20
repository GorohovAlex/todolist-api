require 'swagger_helper'

RSpec.describe 'User', type: :request do
  path 'api/v1/auth' do
    post 'Registration' do
      tags 'Authentication'
      produces 'application/json', 'application/xml'
      parameter name: :params, in: :doby, schema: {
        type: :object,
        properties: {
          'user[username]': { type: :string },
          'user[password]': { type: :string },
          'user[password_confirmation]': { type: :string }
        },
        required: ['user[username]', 'user[password]', 'user[password_confirmation]' ]
      }

      response '201', 'user created' do
        let(:params) { { user: attributes_for(:user) } }
        schema(JSON.parse(File.read('spec/support/api/v1/schemas/user/create.json')))
        run_test!
      end

      response '422', 'Invalid request' do
        run_test!
      end
    end
  end
end
