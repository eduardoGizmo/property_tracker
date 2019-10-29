require('pry-byebug')
require_relative('./models/property_tracker.rb')

#
# PropertyTracker.delete_all

property1 = PropertyTracker.new({
  'address' => 'London Road',
  'num_bedroom' => 2,
  'year_build' => 1990,
  'build_type' => 'Flat'
  })

  property1.save()

  property2 = PropertyTracker.new({
    'address' => 'Easter Road',
    'num_bedroom' => 3,
    'year_build' => 1980,
    'build_type' => 'Detached'
  })
  property2.save()



binding.pry

nil
