require 'rails_helper'
describe 'ユーザーログイン後のテスト' do
    let(:user) {create(:user) }
    let!(:other_user) {create(:user) }
    let!(:post) {create(:post) }
    let!(:other_post) {create(:post)}
    
  before do 
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'Sign In'
  end

  describe 'ヘッダーのテスト' do
    context '表示内容の確認' do
        it 'ヘッダーロゴを押すと、投稿一覧が表示される'do
            find_link("Life Hack Note").click
            expect(current_path).to eq '/posts'
        end
    end
    context 'ドロップメニューテスト' do
      before do
        find(".nav-link.dropdown-toggle").click
      end
        it 'マイページのリンクが存在する' do
          expect(page).to have_link 'マイページ', href: user_path(user)
        end
        it '新規投稿ページのリンクが存在する' do
          expect(page).to have_link '新規投稿', href: new_post_path
        end
        it 'Logout、リンク先が存在する' do
          expect(page).to have_link 'Logout',  href: destroy_user_session_path
        end
        it 'Logout後リダイレクト先が、トップ画面である。' do 
          find_link('Logout').click
          expect(current_path).to eq '/'
        end
      end
    end
  describe '投稿一覧画面のテスト' do
    before do
      visit posts_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/posts'
      end
      it '自分の投稿と他人の投稿のタイトルのリンク先がそれぞれ正しい' do
        expect(page).to have_link post.title, href: post_path(post)
        expect(page).to have_link other_post.title, href: post_path(other_post)
      end
    end
end
  
  describe 'マイページのテスト' do
    before do
      visit user_path(user)
    end

    
    it '自分の名前が表示される' do
        expect(page).to have_content user.name
      end
    it '自分のユーザ編集画面へのリンクが存在する' do
        expect(page).to have_link '', href: edit_user_path(user)
      end 
      
    it '自分の投稿数が表示される' do
        expect(page).to have_content post.count
      end    
    it '自分のbookmark数とリンク先が正しい' do

      end
    it '自分の投稿一覧のタイトルのリンク先が正しい' do
       expect(page).to have_link post.title, href: post_path(post)
    end
    


  end
  
  
  
end