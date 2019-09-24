require 'rails_helper'

describe ProjectPolicy do
  let(:user) { User.create!(email:'waleed6@dev.com', user_type:'manager', password: 'networks12') }
  let(:project) { Project.create(name:'projec_bug', managerid: user.id) }

  subject { described_class }
  permissions :create? do
    context 'asdfasdf' do
      it 'sdfgfg' do
        expect(subject).to permit(user, project)
      end
    end
  end

  permissions :destroy? do
    context 'asdfasdf' do
      it 'sdfgfg' do
        expect(subject).to permit(user, project)
      end
    end
  end
end
