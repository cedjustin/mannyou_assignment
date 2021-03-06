require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do

  before do
    @task = FactoryBot.create(:task, title: 'task')
  end
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示されること' do
        visit tasks_path
        expect(page).to have_content 'test'
      end
    end
    context '複数のタスクを作成した場合' do
      it 'タスクが作成日時の降順に並んでいること' do
        new_task = FactoryBot.create(:second_task, title: 'new_task')
        visit tasks_path
        task_list = all('tbody tr')
        expect(task_list[0]).to have_content 'new_task'
        expect(task_list[1]).to have_content 'task'
      end
    end
  end

#   describe 'タスク登録画面' do
#     context '必要項目を入力して、createボタンを押した場合' do
#       it 'データが保存されること' do
#         visit new_task_path
#         fill_in "Title", with: 'test_title'
#         fill_in "Content", with: 'test_content'
#         click_button 'Create Task'
#         expect(page).to have_content 'test'
#       end
#     end
#   end
#
#   describe 'タスク詳細画面' do
#      context '任意のタスク詳細画面に遷移した場合' do
#        it '該当タスクの内容が表示されたページに遷移すること' do
#          test3 = FactoryBot.create(:task, title: 'test3_title', content: 'test3_content')
#          visit task_path(test3)
#          expect(page).to have_content 'test3'
#        end
#      end
#   end
#
end
