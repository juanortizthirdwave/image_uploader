require 'test_helper'
require 'rails/performance_test_help'

class ImageModelTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }


  test "creation" do
    @image = Image.new
    5.times { |t| @image.fields["custom_field_#{t}".to_sym => "custom_value_#{t}"] }
    @image.save
  end

  # test "slow method" do
  #   # Using posts(:awesome) fixture
  #   posts(:awesome).slow_method
  # end
end
