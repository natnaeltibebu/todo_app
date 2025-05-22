require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      todo = build(:todo)
      expect(todo).to be_valid
    end

    it 'is not valid without a title' do
      todo = build(:todo, title: nil)
      expect(todo).not_to be_valid
      expect(todo.errors[:title]).to include("can't be blank")
    end

    it 'is not valid with an invalid status' do
      todo = build(:todo, status: 'invalid_status')
      expect(todo).not_to be_valid
      expect(todo.errors[:status]).to include("is not included in the list")
    end
  end

  describe 'status values' do
    it 'accepts pending status' do
      todo = build(:todo, status: 'pending')
      expect(todo).to be_valid
    end

    it 'accepts in_progress status' do
      todo = build(:todo, status: 'in_progress')
      expect(todo).to be_valid
    end

    it 'accepts completed status' do
      todo = build(:todo, status: 'completed')
      expect(todo).to be_valid
    end
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:todo)).to be_valid
    end
  end
end