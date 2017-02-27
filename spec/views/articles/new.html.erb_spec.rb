require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    @user = User.create!({
      :email => 'user@test.com',
      :password => 'please',
      :password_confirmation => 'please'
    })
    assign(:article, Article.new(
      :description => "MyString", user_id: User.last.id
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_description[name=?]", "article[description]"
    end
  end
end