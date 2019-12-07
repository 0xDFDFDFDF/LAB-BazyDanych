CREATE KEYSPACE yourname WITH replication = {'class': 'SimpleStrategy', 'replication_factor':1}; 
USE yourname;

CREATE TABLE songs (
  id uuid PRIMARY KEY,
  title text,
  album text,
  artist text,
  data blob
 );


CREATE TABLE playlists (
  id uuid,
  song_order int,
  song_id uuid,
  title text,
  album text,
  artist text,
  PRIMARY KEY  (id, song_order ) );


INSERT INTO playlists (id, song_order, song_id, title, artist, album)
  VALUES(62c36092-82a1-3a00-93d1-46196ee77204, 1,
  a3e64f8f-bd44-4f28-b8d9-6938726e34d4, 'La Grange', 'ZZ Top', 'Tres Hombres');
INSERT INTO playlists (id, song_order, song_id, title, artist, album)
  VALUES(62c36092-82a1-3a00-93d1-46196ee77204, 2,
  8a172618-b121-4136-bb10-f665cfc469eb, 'Moving in Stereo', 'Fu Manchu', 'We Must Obey');


  
INSERT INTO playlists (id, song_order, song_id, title, artist, album)
  VALUES(62c36092-82a1-3a00-93d1-46196ee77204, 3,
  7db1a490-5878-11e2-bcfd-0800200c9a66,
  'Ojo Rojo', 'Fu Manchu', 'No One Rides for Free');
SELECT * FROM playlists;


SELECT album, title FROM playlists WHERE artist = 'Fu Manchu';

CREATE INDEX ON playlists( artist );
SELECT album, title FROM playlists WHERE artist = 'Fu Manchu';


ALTER TABLE playlists ADD tags set<text>;

UPDATE playlists SET tags = tags + {'2007'}
  WHERE id = 62c36092-82a1-3a00-93d1-46196ee77204 AND song_order = 2;
UPDATE playlists SET tags = tags + {'covers'}
  WHERE id = 62c36092-82a1-3a00-93d1-46196ee77204 AND song_order = 2;
UPDATE playlists SET tags = tags + {'1973'}
  WHERE id = 62c36092-82a1-3a00-93d1-46196ee77204 AND song_order = 1;
UPDATE playlists SET tags = tags + {'blues'}
  WHERE id = 62c36092-82a1-3a00-93d1-46196ee77204 AND song_order = 1;


ALTER TABLE playlists ADD reviews list<text>;

ALTER TABLE playlists ADD venue map<timestamp, text>;

UPDATE playlists
  SET reviews = reviews + [ 'best lyrics' ]
  WHERE id = 62c36092-82a1-3a00-93d1-46196ee77204 and song_order = 3;
INSERT INTO playlists (id, song_order, venue)
  VALUES (62c36092-82a1-3a00-93d1-46196ee77204, 3,
  { '2014-1-22 22:00'  : 'Cactus Cafe',
  '2014-01-12 20:00' : 'Mohawk'});

CREATE INDEX ON playlists (tags);
CREATE INDEX mymapvalues ON playlists (venue);
DROP INDEX mymapvalues;
CREATE INDEX mymapkeys ON playlists (KEYS(venue));

SELECT album, tags FROM playlists;
SELECT album, tags FROM playlists WHERE tags CONTAINS 'blues';
SELECT album, venue FROM playlists WHERE venue CONTAINS KEY '2014-01-22 21:00:00+0000';

