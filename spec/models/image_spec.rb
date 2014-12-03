require 'rails_helper'

RSpec.describe Image, :type => :model do
#   context "adding field_ids values and saving" do
#     before do

# # profiling with GC.stat
#     GC.start
#     before_test = GC.stat

#       field = Field.create(name: "City", value: "Chicago")

#       @image = Image.create
#       @image.field_ids << field.id
#       @image.save

#       retrieve_field = @image.fields[0]
      
# # profiling with GC.stat
#     after_test = GC.stat
#     total_allocated_object = after_test[:total_allocated_object] - before_test[:total_allocated_object] 
#     oldmalloc_increase = after_test[:oldmalloc_increase] - before_test[:oldmalloc_increase] 
#     malloc_increase = after_test[:malloc_increase] - before_test[:malloc_increase] 
#     results = "**************\nArray of ID's of associated objects\nTotal allocated objects: #{total_allocated_object}\n"
#     results << "oldmalloc_increase: #{oldmalloc_increase}\n"
#     results << "malloc increase: #{malloc_increase}\n**************\n\n\n"

#     File.open('stats.txt', 'a') { |f| f.write(results) }
#     end

#     it "when retrieving the image from the database" do
#       id = @image.id
#       expect(Image.find(id).field_ids).to eq([5])
#     end
#   end


  context "adding field_ids values and saving" do
    before do
      Benchmark.ips do |x|
        report = x.report("field-model-association") do
          field = Field.create(name: "City", value: "Chicago")

          @image = Image.create
          @image.field_ids << field.id
          @image.save

          retrieve_field = @image.fields[0]
        end
      end
      

      # File.open('stats.txt', 'a') { |f| f.write(report) }
    end

    it "when retrieving the image from the database" do
      id = @image.id
      expect(Image.find(id).field_ids).to eq([Field.last.id])
    end
  end

  context "adding 100 field_ids values and saving" do
    before do
      Benchmark.ips do |x|
        report = x.report("field-model-association-50-fields") do

          @image = Image.create
          (1..50).each do |n|
            field = Field.create(name: "name#{n}", value: "value#{n}")

            @image.field_ids << field.id
          end
          @image.save

          retrieve_fields = @image.fields
        end
      end
      

      # File.open('stats.txt', 'a') { |f| f.write(report) }
    end

    it "when retrieving the image from the database" do
      id = @image.id
      expect(@image.class).to eq(Image)
    end
  end
end
