RSpec.describe 'Projects', type: :request do
  include Docs::V1::Projects::Api

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  describe 'when GET /projects' do
    include Docs::V1::Projects::Index

    context 'when authorized user', :dox do
      it do
        get api_v1_projects_path, params: nil, headers: authenticated_header(user)
        expect(response).to have_http_status(:ok)
        expect(response).to match_response_schema('project/index')
      end
    end

    context 'when not authorized user' do
      it do
        post api_v1_projects_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'when POST /projects' do
    let(:params) { { project: attributes_for(:project) } }

    context 'when authorized user' do
      context 'when valid data' do
        it do
          post api_v1_projects_path, params: params, headers: authenticated_header(user)
          expect(response).to have_http_status(:created)
          expect(response).to match_response_schema('project/create')
        end
      end

      context 'when invalid data' do
        let(:params) { { project: { name: '' } } }

        it do
          post api_v1_projects_path, params: params, headers: authenticated_header(user)
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when not authorized user' do
      it do
        post api_v1_projects_path, params: params
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'when PUT /projects/:id' do
    let(:params) { { project: attributes_for(:project) } }

    context 'when authorized user' do
      context 'when valid data' do
        it do
          put api_v1_project_path(project.id, params), headers: authenticated_header(user)
          expect(response).to have_http_status(:ok)
          expect(response).to match_response_schema('project/create')
        end
      end

      context 'when invalid data' do
        let(:params) { { project: { name: '' } } }

        it do
          put api_v1_project_path(project.id, params), headers: authenticated_header(user)
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when not authorized user' do
      it do
        put api_v1_project_path(project.id, params)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'when DELETE /projects/:id' do
    context 'when authorized user' do
      it do
        delete api_v1_project_path(project.id), headers: authenticated_header(user)
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when not authorized user' do
      it do
        delete api_v1_project_path(project.id)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
