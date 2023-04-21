FactoryBot.define do
  factory :news do
    title { "NEWS 18 HINDI" }
    description { "Hindi News: Read Breaking News, Live Samachar in Hindi of Business, Sports, India, Education, Bollywood, Watch Live Hindi News TV and more on News18 हिंदी. हिंदी समाचार की लोकप्रिय वेबसाइट पर देश, दुनिया, कारोबार, खेल, मनोरंजन से जुड़ी साडी खबरें विस्तार मैं पढ़े - News18 हिंदी" }
    slug { 'livehindustan' }
    url { 'https://www.livehindustan.com/' }
    language { ["hindi"]}
    categories {["top", "sports", "science", "entertainment", "health", "politics", "food"] }
    countries  { ["india"] }
  end
end
