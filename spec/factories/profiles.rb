FactoryBot.define do
  factory :profile do
    name { 'test_farm' }
    description { 'Hello' }
    country { '東京' }
    address { '東京タワー' }
    latitude { 35.65856 }
    longitude { 139.745461 }
  end

  factory :second_profile, class: Profile do
    name { 'test_store' }
    description { 'Nice' }
    country { '神奈川' }
    address {'横浜駅'}
    latitude { 35.4660694 }
    longitude { 139.6226196 }
  end
end
