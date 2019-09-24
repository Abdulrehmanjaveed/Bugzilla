require 'rails_helper'
describe Project, type: :model do
  context 'with 1 user and one bug' do
    it 'check' do
      p = Project.create(name: 'rspec project')
      expect(Project.last).to eq(p)
    end
  end
end
