class CategoryTest < ActiveSupport::TestCase
  test "validation name present" do
    category = Category.new
    assert_equal category.save, false, "Should not able to save a category without a name"
  end
end
