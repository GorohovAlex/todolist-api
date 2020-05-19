RSpec.describe 'TaskComments', type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }
  let(:task_comment) { create(:task_comment, task: task) }

  describe 'when GET /tasks/{:task_id}/task_commentss' do
    context 'when authorized user' do
      it do
        get api_v1_task_task_comments_path(task_id: task.id), headers: authenticated_header(user)
        expect(response).to have_http_status(:ok)
        expect(response).to match_response_schema('task_comment/index')
      end

      context 'when invalid task_id' do
        it do
          get api_v1_task_task_comments_path(task_id: 0), headers: authenticated_header(user)
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when not authorized user' do
      it do
        get api_v1_task_task_comments_path(task_id: 0)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'when POST /task/{:task_id}/task_comments' do
    let(:params) { { task_comment: attributes_for(:task_comment) } }

    context 'when authorized user' do
      context 'when valid data' do
        it do
          post api_v1_task_task_comments_path(task_id: task.id), params: params, headers: authenticated_header(user)
          expect(response).to have_http_status(:created)
          expect(response).to match_response_schema('task_comment/create')
        end
      end

      context 'when invalid data' do
        let(:params) { { task_comment: { comment: '' } } }

        it do
          post api_v1_task_task_comments_path(task_id: task.id), params: params, headers: authenticated_header(user)
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when not authorized user' do
      it do
        post api_v1_task_task_comments_path(task_id: task.id), params: params
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'when DELETE /task_comments/:id' do
    context 'when authorized user' do
      it do
        delete api_v1_task_comment_path(task_comment.id), headers: authenticated_header(user)
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when not authorized user' do
      it do
        delete api_v1_task_comment_path(task_comment.id)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
