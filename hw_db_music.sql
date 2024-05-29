CREATE TABLE if NOT EXISTS music_genres (
  genre_id SERIAL PRIMARY KEY,
  genre_name TEXT not NULL
);

CREATE TABLE if NOT EXISTS artists (
  artist_id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE if NOT EXISTS genres_artists (
  artist_id INTEGER REFERENCES artists(artist_id),
  genre_id INTEGER REFERENCES music_genres(genre_id),
  CONSTRAINT g_a PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE if NOT EXISTS albums (
  album_id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL,
  release_year DATE
);

CREATE TABLE if NOT EXISTS artists_albums (
  artist_id INTEGER REFERENCES artists(artist_id),
  album_id INTEGER REFERENCES albums(album_id),
  CONSTRAINT a_a PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE if NOT EXISTS songs (
  song_id SERIAL PRIMARY KEY,
  album_id INTEGER REFERENCES albums(album_id),
  song_name TEXT NOT NULL,
  duration INTEGER
);

CREATE TABLE if NOT EXISTS collections (
  collection_id SERIAL PRIMARY KEY,
  collection_name TEXT NOT NULL,
  collection_release_year DATE
);

CREATE TABLE if NOT EXISTS collections_songs (
  collection_id INTEGER REFERENCES collections(collection_id),
  song_id INTEGER REFERENCES songs(song_id),
  CONSTRAINT c_s PRIMARY KEY (collection_id, song_id)
);