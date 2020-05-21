RSpec.describe 'Tasks', type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }

  describe 'when GET /projects/{:project_id}/tasks' do
    context 'when authorized user' do
      it do
        get api_v1_project_tasks_path(project_id: project.id), headers: authenticated_header(user)
        expect(response).to have_http_status(:ok)
        expect(response).to match_response_schema('task/index')
      end

      context 'when invalid project_id' do
        it do
          get api_v1_project_tasks_path(project_id: 0), headers: authenticated_header(user)
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when not authorized user' do
      it do
        post api_v1_projects_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'when POST /projects/{:project_id}/tasks' do
    let(:params) { { task: attributes_for(:task) } }

    context 'when authorized user' do
      context 'when valid data' do
        it do
          post api_v1_project_tasks_path(project_id: project.id), params: params, headers: authenticated_header(user)
          expect(response).to have_http_status(:created)
          expect(response).to match_response_schema('task/create')
        end
      end

      context 'when invalid data' do
        let(:params) { { task: { name: '' } } }

        it do
          post api_v1_project_tasks_path(project_id: project.id), params: params, headers: authenticated_header(user)
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when not authorized user' do
      it do
        post api_v1_project_tasks_path(project_id: project.id), params: params
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'when GET /tasks/:id' do
    context 'when authorized user' do
      it 'send valid id' do
        get api_v1_task_path(task.id), headers: authenticated_header(user)
        expect(response).to have_http_status(:ok)
        expect(response).to match_response_schema('task/create')
      end

      it 'send invalid id' do
        get api_v1_task_path(0), headers: authenticated_header(user)
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when not authorized user' do
      it do
        get api_v1_task_path(task.id)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'when PUT /tasks/:id' do
    let(:params) { { task: attributes_for(:task) } }

    context 'when authorized user' do
      context 'when valid data' do
        it do
          put api_v1_task_path(task.id, params), headers: authenticated_header(user)
          expect(response).to have_http_status(:ok)
          expect(response).to match_response_schema('task/create')
        end
      end

      context 'when invalid data' do
        let(:params) { { task: { deadline: 'aaaa' } } }

        it do
          put api_v1_task_path(task.id, params), headers: authenticated_header(user)
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when not authorized user' do
      it do
        put api_v1_task_path(task.id, params)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'when DELETE /tasks/:id' do
    context 'when authorized user' do
      it do
        delete api_v1_task_path(task.id), headers: authenticated_header(user)
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when not authorized user' do
      it do
        delete api_v1_task_path(task.id)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
