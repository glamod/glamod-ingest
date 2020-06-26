ALTER TABLE station_configuration ALTER primary_id_scheme SET NOT NULL ;

ALTER TABLE station_configuration ADD PRIMARY KEY (primary_id_scheme);


