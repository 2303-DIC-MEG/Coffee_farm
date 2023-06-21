require 'rails_helper'
RSpec.describe 'ブログ投稿管理機能', type: :system do
  let!(:user) {FactoryBot.create(:user)}
  let!(:blog) { FactoryBot.create(:blog, user: user) }
  let!(:second_blog) { FactoryBot.create(:second_blog, user: user) }
  let!(:profile) { FactoryBot.create(:profile, user_id: user.id) }

  describe '投稿機能のテスト' do
    context '投稿を新規作成した場合' do
      it '全て入力したら正常に投稿できること' do
        visit new_user_session_path
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        visit new_blog_path
        fill_in 'blog_title', with: 'test_title' 
        fill_in 'blog_content', with: 'test_content'
        click_button '登録'
        expect(page).to have_content 'ブログを投稿しました'
      end
    end
  end
  describe '編集機能のテスト' do
    context 'ブログを編集した場合' do
      it '編集したタイトルが表示される' do
        visit new_user_session_path
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        visit edit_blog_path(blog)
        fill_in 'blog_title', with: 'test_test' 
        fill_in 'blog_content', with: 'test_content'
        click_button '更新する'
        expect(page).to have_content 'ブログを更新する'
      end
        it '編集した内容が表示される' do
        visit new_user_session_path
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        visit edit_blog_path(blog)
        fill_in 'blog_title', with: 'test_title' 
        fill_in 'blog_content', with: 'test_content2'
        click_button '更新する'
        expect(page).to have_content 'ブログを更新する'
      end
      context 'タイトルを空白にした場合' do
        it '編集できない旨が表示される' do
          visit new_user_session_path
          fill_in 'user_email', with: 'test@example.com'
          fill_in 'user_password', with: '12345678'
          click_button 'ログイン'
          visit edit_blog_path(blog)
          fill_in 'blog_title', with: '' 
          fill_in 'blog_content', with: 'test_content'
          click_button '更新する'
          expect(page).to have_content 'タイトルを入力してください'
        end
      end
      context '内容を空白にした場合' do
        it '編集できない旨が表示される' do
          visit new_user_session_path
          fill_in 'user_email', with: 'test@example.com'
          fill_in 'user_password', with: '12345678'
          click_button 'ログイン'
          visit edit_blog_path(blog)
          fill_in 'blog_title', with: 'test_title' 
          fill_in 'blog_content', with: ''
          click_button '更新する'
          expect(page).to have_content 'コンテンツを入力してください'
        end
      end
    end
  end
  describe '詳細機能のテスト' do
    context 'ブログの詳細を確認した場合' do
      it 'ブログの詳細を表示する' do
        visit new_user_session_path
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        visit blogs_path
        first(".card").click
        expect(page).to have_content 'test_title'
        expect(page).to have_content 'test_content'
      end
    end
  end
  describe '削除機能のテスト' do
    context '既存のブログを削除した場合' do
      it '削除したブログの投稿がなくなる' do
        visit new_user_session_path
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        visit blogs_path
        first(".card").click
        click_link 'Edit'
        click_link 'Destroy'
        expect(page.accept_confirm).to eq "Are you sure?"
        expect(page).to have_content "Blog was successfully destroyed."
      end
    end
  end
end