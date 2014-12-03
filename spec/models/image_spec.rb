require 'rails_helper'

RSpec.describe Image, :type => :model do
#   context "adding field values and saving" do
#     before do
#       # profiling with GC.stat
#     GC.start
#     before_test = GC.stat


#       @image = Image.create
#       @image.fields.merge! city: "Chicago"
#       @image.save

# # profiling with GC.stat
#     after_test = GC.stat
#     total_allocated_object = after_test[:total_allocated_object] - before_test[:total_allocated_object] 
#     oldmalloc_increase = after_test[:oldmalloc_increase] - before_test[:oldmalloc_increase] 
#     malloc_increase = after_test[:malloc_increase] - before_test[:malloc_increase] 
#     results = "**************\nHash storing random attributes\nTotal allocated objects: #{total_allocated_object}\n"
#     results << "oldmalloc_increase: #{oldmalloc_increase}\n"
#     results << "malloc increase: #{malloc_increase}\n**************\n\n\n"

#     File.open('stats.txt', 'a') { |f| f.write(results) }
#     end

#     it "when retrieving the image from the database" do
#       id = @image.id
#       expect(Image.find(id).fields[:city]).to eq("Chicago")
#     end
#   end

  context "adding field_ids values and saving" do
    before do
      Benchmark.ips do |x|
        x.report("hash-serialization") do

          @image = Image.create
          @image.fields.merge! city: "Chicago"
          @image.save

          retrieved_field = @image.fields
        end
      end
      
      # File.open('stats.txt', 'a') { |f| f.write(report) }
    end

    it "when retrieving the image from the database" do
      id = @image.id
      expect(Image.find(id).fields[:city]).to eq("Chicago")
    end
  end

  context "adding 50 field_ids values and saving" do
    before do
      Benchmark.ips do |x|
        x.report("hash-serialization-50-fields") do

          @image = Image.create
          (1..50).each do |n|
            @image.fields.merge! "city#{n}".to_sym => "Chicago#{n}"
          end
          @image.save

          retrieved_field = @image.fields
        end
      end
      
      # File.open('stats.txt', 'a') { |f| f.write(report) }
    end

    it "when retrieving the image from the database" do
      id = @image.id
      expect(Image.find(id).fields[:city1]).to eq("Chicago1")
    end
  end
end
