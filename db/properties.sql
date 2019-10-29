DROP TABLE IF EXISTS properties_details;

CREATE TABLE properties_details(

  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  num_bedroom INT2,
  year_build INT2,
  build_type VARCHAR(255)
);
