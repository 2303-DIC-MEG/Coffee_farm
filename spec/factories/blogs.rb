FactoryBot.define do
  factory :blog do
    title { 'test_title' }
    content { 'test_content' }
  end

  factory :second_blog, class: blog do
    title { 'test_title2' }
    content { 'test_content2' }
  end
end
