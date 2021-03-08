RSpec.describe 'User', type: :request do
  describe 'when POST /auth' do
    let(:params) { { user: attributes_for(:user) } }

    context 'when not authorized user' do
      context 'when valid data' do
        it 'return user data' do
          post api_v1_auth_path, params: params
          expect(response).to have_http_status(:created)
          expect(response).to match_response_schema('user/create')
        end
      end

      context 'when invalid data' do
        let(:params) { { user: { name: '' } } }

        it do
          post api_v1_auth_path, params: params
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
