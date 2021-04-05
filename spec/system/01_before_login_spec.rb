require 'rails_helper'

describe 'ユーザーログイン前のテスト' do
  
  describe 'top画面のテスト' do
    before do
      visit root_path
    end

  context '表示内容の確認' do
    it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
  
    it 'Sign_in リンクの内容が正しい' do
      find_link("Sign In").click
      expect(current_path).to eq '/users/sign_in'
    end
    
    it 'Sign_up リンクの内容が正しい' do
      find_link("Sign Up").click
      expect(current_path).to eq '/users/sign_up'
    end
  end
end
  
  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button 'Sign Up' }.to change(User.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、新規登録できたユーザの詳細画面になっている' do
        click_button 'Sign Up'
        expect(current_path).to eq '/users/' + User.last.id.to_s
      end
    end
    context '新規登録失敗のテスト' do
      before do
        fill_in 'user[name]', with: ""
        fill_in 'user[email]', with: ""
        fill_in 'user[password]', with: ""
        fill_in 'user[password_confirmation]', with: ""

      end

      it '新規登録に失敗し、新規登録画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_up'
      end
    end
  end

  describe 'ユーザログインのテスト' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[name]', with: user.name
        fill_in 'user[password]', with: user.password
        click_button 'Sign In'
      end

      it 'ログイン後のリダイレクト先が、ログインしたユーザの詳細画面になっている' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[name]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'Sign In'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end
end

