require 'rails_helper'

RSpec.describe NoteForm, type: :model do
  before do
    @note = FactoryBot.build(:note_form)
    end

  describe '投稿機能' do
    context '投稿できる時' do
      it '正しいデータが入力されている場合' do
        expect(@note).to be_valid
      end
    end

    context '投稿できない時' do
      it 'contentが空では登録できない' do
        @note.content = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Content can't be blank")
      end

      it 'tag_nameが空では登録できない' do
        @note.tag_name = '' 
        @note.valid?
        expect(@note.errors.full_messages).to include("Tag name can't be blank")
      end

      it 'genre_idが未選択項目だと登録できない' do
        @note.genre_id = 1 # 未選択項目のidを指定
        @note.valid?
        expect(@note.errors.full_messages).to include("Genre can't be blank")
      end

      it 'userが紐づいていない場合登録できない' do
        @note.user_id = FactoryBot.create(:user).id
        @note.user_id = nil
        @note.valid?
        expect(@note.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end

#メモ：テスト実行前に rails db:test:prepare をするとテストデータベースが正しく設定され、テストが実行できるようになる