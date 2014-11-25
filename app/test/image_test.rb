require "../../config/environment.rb"

# profiling with GC.stat
    GC.start
    before_test = GC.stat

      field = Field.create(name: "City", value: "Chicago")

      @image = Image.create
      @image.field_ids << field.id
      @image.save

      retrieve_field = @image.fields[0]
      
# profiling with GC.stat
    after_test = GC.stat
    total_allocated_object = after_test[:total_allocated_object] - before_test[:total_allocated_object] 
    oldmalloc_increase = after_test[:oldmalloc_increase] - before_test[:oldmalloc_increase] 
    malloc_increase = after_test[:malloc_increase] - before_test[:malloc_increase] 
    results = "**************\nArray of ID's of associated objects\nTotal allocated objects: #{total_allocated_object}\n"
    results << "oldmalloc_increase: #{oldmalloc_increase}\n"
    results << "malloc increase: #{malloc_increase}\n**************\n\n\n"

    File.open('stats.txt', 'a') { |f| f.write(results) }