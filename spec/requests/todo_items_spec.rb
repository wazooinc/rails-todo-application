require 'rails_helper'

RSpec.describe '/todo_items', type: :request do

  current_account = Account.first_or_create!(email: 'user@user.com', password: 'password', password_confirmation: 'password')

  let(:valid_attributes) do
    {
      'id' => '1',
      'title' => 'Test',
      'is_completed' => false
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'abcdef',
      'title' => 1,
      'is_completed' => 'abcdef'
    }
  end

  describe 'GET /index' do

    it 'renders a successful response' do
      sign_in(current_account)
      todo_item = TodoItem.new(valid_attributes)
      todo_item.account = current_account
      todo_item.save
      get todo_items_url
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      sign_in(current_account)
      get new_todo_item_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      sign_in(current_account)
      todo_item = TodoItem.new(valid_attributes)
      todo_item.account = current_account
      todo_item.save
      get edit_todo_item_url(todo_item)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new TodoItem' do
        sign_in(current_account)
        expect do
          post todo_items_url, params: {todo_item: valid_attributes}
        end.to change(TodoItem, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new TodoItem' do
        sign_in(current_account)
        expect do
          post todo_items_url, params: {todo_item: invalid_attributes}
        end.to change(TodoItem, :count).by(1)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          'id' => '1',
          'title' => 'New TodoItem',
          'is_completed' => true
        }
      end

      it 'updates the requested todo_item' do
        sign_in(current_account)
        todoItem = TodoItem.new(valid_attributes)
        todoItem.account = current_account
        todoItem.save
        patch todo_item_url(todoItem), params: {todo_item: new_attributes}
        todoItem.reload
        expect(todoItem[:title]).to eq(new_attributes["title"])
        expect(todoItem[:is_completed]).to eq(true)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the given todo_item' do
      sign_in(current_account)
      todoItem = TodoItem.new(valid_attributes)
      todoItem.account = current_account
      todoItem.save
      expect do
        delete todo_item_url(todoItem)
      end.to change(TodoItem, :count).by(-1)
    end
  end


end