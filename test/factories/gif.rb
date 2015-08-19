FactoryGirl.define do
  factory :gif do
    image_url "http://i.giphy.com/10xB68TPIDDOKs.gif"
    user      {|u| FactoryGirl.create(:user)}
  end
end
