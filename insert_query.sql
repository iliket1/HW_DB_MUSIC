INSERT INTO music_genres (genre_name) VALUES
('Rock'),
('Pop'),
('Jazz');

INSERT INTO artists (artist_name) VALUES 
('Queen'), 
('Adele'), 
('Miles Davis'), 
('Imagine Dragons');

INSERT INTO genres_artists (artist_id, genre_id) VALUES 
(1, 1),  -- Queen - Rock
(2, 2),  -- Adele - Pop
(3, 3),  -- Miles Davis - Jazz
(4, 1),  -- Imagine Dragons - Rock
(4, 2);  -- Imagine Dragons - Pop

INSERT INTO albums (album_name, release_year) VALUES 
('A Night at the Opera', '1975-11-21'), 
('21', '2011-01-24'), 
('Kind of Blue', '1959-08-17');

INSERT INTO artists_albums (artist_id, album_id) VALUES 
(1, 1),  -- Queen - A Night at the Opera
(2, 2),  -- Adele - 21
(3, 3);  -- Miles Davis - Kind of Blue

INSERT INTO songs (song_name, duration, album_id) VALUES 
('Bohemian Rhapsody', 355, 1),  -- 5 минут 55 секунд
('Love of My Life', 218, 1),  -- 3 минуты 38 секунд
('Rolling in the Deep', 228, 2),  -- 3 минуты 48 секунд
('Someone Like You', 285, 2),  -- 4 минуты 45 секунд
('So What', 562, 3),  -- 9 минут 22 секунды
('Freddie Freeloader', 589, 3);  -- 9 минут 49 секунд

INSERT INTO collections (collection_name, collection_release_year) VALUES 
('Best of Rock 2020', '2020-01-01'), 
('Smooth Jazz Hits', '2019-01-01'), 
('Pop Hits 2018', '2018-01-01'), 
('Classic Rock Collection', '2018-01-01');

INSERT INTO collections_songs (collection_id, song_id) VALUES 
(1, 1),  -- Best of Rock 2020 - Bohemian Rhapsody
(1, 4),  -- Best of Rock 2020 - Someone Like You
(2, 5),  -- Smooth Jazz Hits - So What
(2, 6),  -- Smooth Jazz Hits - Freddie Freeloader
(3, 3),  -- Pop Hits 2018 - Rolling in the Deep
(4, 2);  -- Classic Rock Collection - Love of My Life