CREATE TABLE hub_driver (
	driver_hash_key varchar(255) NOT NULL,
	load_timestamp timestamp NOT NULL,
	record_source varchar(255) NOT NULL,
	product_code varchar(255) NOT NULL,
	CONSTRAINT hub_driver_pk PRIMARY KEY (driver_hash_key)
)


CREATE TABLE hub_driver_license (
	driver_license_hash_key varchar(255) NOT NULL,
	load_timestamp timestamp NOT NULL,
	record_source varchar(255) NOT NULL,
	product_code varchar(255) NOT NULL,
	CONSTRAINT hub_driver_license_pk PRIMARY KEY (driver_license_hash_key)
)


CREATE TABLE link_line_item (
	line_item_hash_key varchar(255) NOT NULL,
	load_date TIMESTAMP NOT NULL,
	record_source varchar(255) NOT NULL,
	driver_hash_key varchar(255) NOT NULL,
	driver_license_hash_key varchar(255) NOT NULL,
	CONSTRAINT link_line_item_pk PRIMARY KEY (line_item_hash_key)
)


CREATE TABLE sat_driver (
	driver_hash_key varchar(255) NOT NULL,
	load_timestamp TIMESTAMP NOT NULL,
	record_source varchar(255) NOT NULL,
	comment varchar(255) NOT NULL,
     dob DATETIME NOT NULL,
	surname varchar(255) NOT NULL,
     name varchar(255) NOT NULL,
     patronymic varchar(255) NOT NULL
)



CREATE TABLE sat_driver_license (
	driver_license_hash_key varchar(255) NOT NULL,
	load_timestamp TIMESTAMP NOT NULL,
	record_source varchar(255) NOT NULL,
	comment varchar(255) NOT NULL,
    number varchar(255) NOT NULL,
    date_created DATETIME NOT NULL
)

ALTER TABLE link_line_item ADD CONSTRAINT link_line_item_fk0 FOREIGN KEY (driver_hash_key) REFERENCES hub_driver (driver_hash_key );
ALTER TABLE link_line_item ADD CONSTRAINT link_line_item_fk1 FOREIGN KEY (driver_license_hash_key) REFERENCES hub_driver_license(driver_license_hash_key );

ALTER TABLE sat_driver  ADD CONSTRAINT sat_driver_fk0 FOREIGN KEY (driver_hash_key) REFERENCES hub_driver(driver_hash_key);

ALTER TABLE sat_driver_license  ADD CONSTRAINT sat_driver_license_fk0 FOREIGN KEY (driver_license_hash_key) REFERENCES hub_driver_license(driver_license_hash_key);
