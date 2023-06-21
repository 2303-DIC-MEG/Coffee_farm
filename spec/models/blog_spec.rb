require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe "モデルのバリデーションのテスト" do
    let(:user) { FactoryBot.create(:user) }
    let!(:blog) { FactoryBot.create(:blog, user_id: user.id) }
    describe "ブログの登録確認" do
      context "必要な情報が全て登録された場合" do
        it "ブログが登録ができる" do
          expect(blog).to be_valid
        end
      end
    end
    describe "titleカラムの確認" do
      context "タイトルが登録されなかった場合" do
        it "ブログが登録ができない" do
          blog.title = ""
          expect(blog).not_to be_valid
        end
      end
    end
    describe "contentカラムの確認" do
      context "ブログの内容がなかった場合" do
        it "ブログの登録ができない" do
          blog.content = ""
          expect(blog).not_to be_valid
        end
      end   
      context "ブログの内容の文字数が300以上だった場合" do
        it "ブログの登録ができない" do
          blog.content = "a" * 301
          expect(blog).not_to be_valid
        end
      end   
    end
  end
end
