module Docs
  module V1
    module Authentication
      extend Dox::DSL::Syntax

      document :api do
        resource 'Api' do
          endpoint '/auth'
          group 'Authentication'
        end
      end

      document :create do
        action 'Sign Up'
      end

      document :sign_in do
        action 'Sign In'
      end
    end
  end
end
