require 'rails_helper'
describe ProjectsController, type: :controller do

  describe "GET project" do
    pr = Project.create(name:'projec_bug')
    before do
      u = User.create!(email:'aaa@dev.com', user_type:'manager',password: 'networks12')
      sign_in u
    end

    it "index action" do
      u = User.create!(email:'spemanager1s@dev.com', user_type:'manager',password: 'networks12')
      project = Project.create(name:'projec_bug')
      get :index
      expect(response.status).to eq(200)
    end

    it "creates action" do 
      project_params = {project: { name: 'project param'}}
      expect { post :create, :params => project_params }.to change(Project, :count).by(1) 
    end

    it 'delete action' do
      pro = Project.last
      expect { delete :destroy, :params => {id: pro.id }}.to change { Project.count }.by(-1)
    end

    it "show action" do
      pr = Project.create(name:'projec_bug')
      get :show, :params => {id: pr.id }
      assigns(:project).should eq(pr)
    end

    it "update action" do
      pro = Project.last
      project_params = {project: { name: 'project paramsss'}, id: pro.id}
      put :update, params: project_params
      pro1 = Project.last
      pro1.name.should eq('project paramsss')
    end
  end
end
