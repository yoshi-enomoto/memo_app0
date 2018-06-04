require "rails_helper"
describe TodosController do
  describe "#index" do
    it "assigns @todo" do
      todos = create_list(:todo, 5)
      get :index
      expect(assigns(:todos)).to match(todos.sort{ |a, b| a.created_at <=> b.created_at })
    end

    it "renders the :index template" do
      todo = create(:todo)
      get :index
      expect(response).to render_template :index
    end

  end

  describe "#create" do
    # 後半、『{』は二重を要する。
    context "can save" do
      # テストを通す為に変更2/2
      # ActionController::ParameterMissing: param is missing or the value is empty: todoが出て、1:ストパラの設定と、2:パラメータの渡し方が犯人の模様。
      # let(:params) { { todo: attributes_for(:todo) } }

      subject {
        post :create,
        # params: params
        todo: { content: Faker::Lorem.word}
      }

      it "count up todo" do
        expect{ subject }.to change(Todo, :count).by(1)
      end

      it "redirects to root_path" do
        subject
        expect(response).to redirect_to(root_path)
      end
    end

    context "can't save" do
      let(:invalid_params) { { todo: attributes_for(:todo, content: nil) } }

      subject {
        post :create,
        params: invalid_params
      }

      it "dosen't count up" do
        expect{ subject }.not_to change(Todo, :count)
      end

      it "renders the :index template" do
        subject
        expect(response).to render_template :index
      end
    end
  end
end


