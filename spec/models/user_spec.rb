require 'rails_helper'

RSpec.describe User, type: :model do
  describe "モデルのバリデーションのテスト" do
    let!(:user) { FactoryBot.create(:user) }
    describe "登録確認" do
      context "必要な情報が全て登録された場合" do
        it "ユーザー登録ができる" do
          expect(user).to be_valid
        end
      end
    end
    describe "nameカラムの確認" do
      context "名前が登録されなかった場合" do
        it "ユーザー登録ができない" do
          user.name = ""
          expect(user).not_to be_valid
        end
      end
      context "名前の文字数が30以上だった場合" do
        it "ユーザー登録ができない" do
          user.name = "a" * 31
          expect(user).not_to be_valid
        end
      end
    end
    describe "emailカラムの確認" do
      context "メールアドレスが登録されなかった場合" do
        it "ユーザー登録ができない" do
          user.email = ""
          expect(user).not_to be_valid
        end
      end
      context "メールアドレスの文字数が255以上だった場合" do
        it "ユーザー登録ができない" do
          user.email = "a" * 256 + '@example.com'
          expect(user).not_to be_valid
        end
      end
      context "メールアドレスが規定の形式と異なった場合" do
        it "ユーザー登録ができない" do
          user.email = "a" * 20
          expect(user).not_to be_valid
        end
      end
      context "メールアドレスが既存のものと重複した場合" do
        it "ユーザー登録ができない" do
          second_user = User.new(
            name: "test2",
            email: "test@example.com",
            password: "password2"
          )
          expect(second_user).not_to be_valid
        end
      end
    end
  end
end
