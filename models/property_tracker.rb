require('pg')

class PropertyTracker

  attr_accessor :address, :num_bedroom, :year_build, :build_type
  attr_reader :id

  def initialize(options)
    @address = options['address']
    @num_bedroom = options['num_bedroom'].to_i
    @year_build = options['year_build'].to_i
    @build_type = options['build_type']
    @id = options['id'].to_i if options['id']
  end



  def save()
    db = PG.connect({dbname: 'real_estate', host: 'localhost'})
    sql = "INSERT INTO properties_details(
    address, num_bedroom, year_build, build_type
    ) VALUES ($1, $2, $3, $4)
    RETURNING *;"

    values = [@address, @num_bedroom, @year_build, @build_type]

    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    @id = result[0]['id'].to_i
    db.close()
end

def update()
  db = PG.connect({ dbname: 'real_estate', host: 'localhost'})
  sql = "UPDATE properties_details SET ( address, num_bedroom, year_build, build_type )
  = ($1, $2, $3, $4) WHERE id = $5"

  values = [@address, @num_bedroom, @year_build, @build_type, @id]
  db.prepare("update", sql)
  db.exec_prepared("update", values)
  db.close()

end

def delete()
  db = PG.connect({dbname: 'real_estate', host: 'localhost'})
  sql = "DELETE FROM properties_details WHERE id = $1"
  values = [@id]
  db.prepare("delete_one", sql)
  db.exec_prepared("delete_one", values)
  db.close()

end


end
