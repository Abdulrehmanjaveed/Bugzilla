# require 'rails_helper'

# describe Bug, type: :model do
#   context 'Checking rspec for bug' do
#   	pr = Project.create(name:'projec_bug')
#     u = User.create!(email:'sspa@dev.com', user_type:'qa',password: 'networks12')
#     b = Bug.create!(title: 'sspea bu', project_id:pr.id, user_id: u.id, bugtype: 'bug', status: 'new')
#     it 'create bug' do
#       expect(Bug.last).to eq(b)
#     end
#     it 'delete bug' do
#     	expect do
#     		Bug.last.destroy
#        end.to change(Bug, :count).by(-1)
# 	end
#   end
# end

