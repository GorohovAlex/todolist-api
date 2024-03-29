require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      consumes: ['application/json'],
      produces: ['application/json'],
      paths: {},
      servers: [
        {
          url: 'http://localhost:3000',
          variables: {
            defaultHost: {
              default: 'localhost:3000/api/v1/'
            }
          }
        }
      ]
    }
  }

  config.swagger_format = :json
end
