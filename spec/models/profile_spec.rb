require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "モデルのバリデーションのテスト" do
    let(:user) { FactoryBot.create(:user) }
    let!(:profile) { FactoryBot.create(:profile, user_id: user.id) }
    describe "登録確認" do
      context "必要な情報が全て登録された場合" do
        it "プロフィールが登録ができる" do
          expect(profile).to be_valid
        end
      end
    end
    describe "nameカラムの確認" do
      context "名前が登録されなかった場合" do
        it "プロフィールの登録ができない" do
          profile.name = ""
          expect(profile).not_to be_valid
        end
      end
    end
    describe "descriptionカラムの確認" do
      context "紹介文の登録がなかった場合" do
        it "プロフィールの登録ができない" do
          profile.description = ""
          expect(profile).not_to be_valid
        end
      end   
      context "紹介文の文字数が100以上だった場合" do
        it "プロフィールの登録ができない" do
          profile.description = "a" * 101
          expect(profile).not_to be_valid
        end
      end   
    end
    describe "countryカラムの確認" do
      context "国名が登録されなかった場合" do
        it "プロフィールの登録ができない" do
          profile.country = ""
          expect(profile).not_to be_valid
        end
      end   
    end
    describe "addressカラムの確認" do
      context "住所が登録されなかった場合" do
        it "プロフィールの登録ができない" do
          profile.address= ""
          expect(profile).not_to be_valid
        end
      end   
    end
  end
end
      