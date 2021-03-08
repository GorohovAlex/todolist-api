RSpec.describe 'Session', type: :request do
  describe 'when POST /auth/sign_in' do
    let(:user_params) { attributes_for(:user) }
    let!(:user) { User.create(user_params) }
    let(:params) { user_params }

    context 'when not authorized user' do
      context 'when valid data' do
        it 'return user data' do
          post api_v1_auth_sign_in_path, params: params
          expect(response).to have_http_status(:ok)
          expect(response).to match_response_schema('session/create')
        end
      end

      context 'when invalid user_name' do
        let(:params) { { username: '', password: '' } }

        it do
          post api_v1_auth_sign_in_path, params: params
          expect(response).to have_http_status(:not_found)
        end
      end

      context 'when invalid password' do
        let(:params) { { username: user_params[:username], password: '' } }

        it do
          post api_v1_auth_sign_in_path, params: params
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end

  describe 'when DELETE /auth/sign_out' do
    let(:user) { create(:user) }

    context 'when authorized user' do
      it do
        delete api_v1_auth_sign_out_path, headers: authenticated_header(user)
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when not authorized user' do
      it do
        delete api_v1_auth_sign_out_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
