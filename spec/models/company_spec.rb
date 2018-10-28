require 'rails_helper'

describe Company, type: :model do
  let!(:company){ build(Company) }

  describe 'Validation' do
    context '正常値の場合' do
      it '保存ができる' do
        expect{ build(Company).save! }.not_to raise_error
        first_record = Company.order('created_at DESC').first
        expect(first_record.name).to eq company.name
        expect(first_record.base_url).to eq company.base_url
      end

      it '同じタイトルのレコードを２件登録できない' do
        expect{ build(Company).save! }.not_to raise_error
        expect{ build(Company).save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context '異常値の場合' do
      it '保存ができない' do
        expect{ build(Company, :name_is_blank).save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
