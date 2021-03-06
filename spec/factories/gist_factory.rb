require 'factory_girl'

FactoryGirl.define do

  lines = File.readlines(File.join(File.dirname(__FILE__), "gist_titles.txt"))

  factory :gist do
    sequence(:title) { |n| lines[n] }
    link        "http://www.hansel.com/"
    text        "http://www.hansel.com"
    done        false
    created_at  Time.now

    factory :text_gist do
      link  nil
    end

    factory :done_gist do
      done  true
    end

    factory :mixed_gist do
      link nil
      text "Mix this in with http://www.hansel.com"
    end

    factory :tagged_gist do
      tags ["derek", "hansel"]
    end

  end

end
