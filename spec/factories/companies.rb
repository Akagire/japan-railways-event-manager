FactoryBot.define do
  factory :company do
    name 'JR東日本'
    base_url 'http://www.jreast.co.jp/press/'
  end

  trait 'name_is_blank' do
    name ''
  end
end
