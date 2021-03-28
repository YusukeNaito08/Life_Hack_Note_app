require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        is_expected.to eq false
      end
      it '10文字以下であること: 10文字は〇' do
        user.name = Faker::Lorem.characters(number: 10)
        is_expected.to eq true
      end
      it '10文字以下であること: 11文字は×' do
        user.name = Faker::Lorem.characters(number: 11)
        is_expected.to eq false
      end
      it '一意性があること' do
        user.name = other_user.name
        is_expected.to eq false
      end
    end

    context 'emailカラム' do
      it '空欄でないこと' do
        user.email = ''
        is_expected.to eq false
      end
      it '一意性があること' do
        user.email = other_user.email
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Bookモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end

    context 'Bookmarkモデルとの関係' do
      it '1:Nになっている' do
        expect(User.reflect_on_association(:bookmarks).macro).to eq :has_many
      end
    end
  end
end
