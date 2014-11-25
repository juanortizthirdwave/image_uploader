require 'test_helper'
require 'rails/performance_test_help'

class ImageModelTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

  self.profile_options = { runs: 1 }




  test "creation" do
    # profiling with  GC:Profiler
    # GC::Profiler.enable

    # profiling with GC.stat
    GC.start
    before_test = GC.stat


    @image = Image.new
    5.times { |t| @image.fields["custom_field_#{t}".to_sym => "custom_value_#{t}"] }
    @image.save

    # profiling with  GC:Profiler
    # report = GC::Profiler.result
    # GC::Profiler.disable
    # results = "**************\nHash with Image random attributes\n"
    # results << report
    # results << "\n**************\n\n\n"

    # # profiling with GC.stat
    after_test = GC.stat
    total_allocated_object = after_test[:total_allocated_object] - before_test[:total_allocated_object] 
    oldmalloc_increase = after_test[:oldmalloc_increase] - before_test[:oldmalloc_increase] 
    malloc_increase = after_test[:malloc_increase] - before_test[:malloc_increase] 

    results = "**************\nHash with Image random attributes\nTotal allocated objects: #{total_allocated_object}\n"
    results << "oldmalloc_increase: #{oldmalloc_increase}\n"
    results << "malloc increase: #{malloc_increase}\n**************\n\n\n"

    File.open('stats.txt', 'a') { |f| f.write(results) }
  end



  # test "slow method" do
  #   # Using posts(:awesome) fixture
  #   posts(:awesome).slow_method
  # end
end