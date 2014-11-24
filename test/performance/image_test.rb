require 'test_helper'
require 'rails/performance_test_help'

class ImageModelTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }


  test "creation" do
    @image = Image.new
    (1..5).each do |n|
      f = Field.create(name: "custom_field_#{n}", value: "custom_value_#{n}") 
      @image.field_ids << f.id
    end
    @image.save
  end

  # test "slow method" do
  #   # Using posts(:awesome) fixture
  #   posts(:awesome).slow_method
  # end
end
