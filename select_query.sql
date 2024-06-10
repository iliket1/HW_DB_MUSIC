-- Название и продолжительность самого длительного трека
SELECT song_name, duration 
FROM songs 
WHERE duration = (
   SELECT MAX(duration)
   FROM songs
   );

-- Название треков, продолжительность которых не менее 3,5 минут (210 секунд)
SELECT song_name 
FROM songs 
WHERE duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT collection_name 
FROM collections 
WHERE collection_release_year BETWEEN '2018-01-01' AND '2020-12-31';

-- Исполнители, чьё имя состоит из одного слова
SELECT artist_name 
FROM artists 
WHERE artist_name NOT LIKE '% %';

-- Название треков, которые содержат слово «Мой» или «My»
SELECT song_name 
FROM songs 
WHERE song_name LIKE '%Мой%' OR song_name LIKE '%My%';

-- Количество исполнителей в каждом жанре
SELECT g.genre_name, COUNT(ga.artist_id) AS artist_count
FROM music_genres g
JOIN genres_artists ga ON g.genre_id = ga.genre_id
GROUP BY g.genre_name;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(s.song_id) AS song_count
FROM songs s
JOIN albums a ON s.album_id = a.album_id
WHERE a.release_year BETWEEN '2019-01-01' AND '2020-12-31';

-- Средняя продолжительность треков по каждому альбому
SELECT a.album_name, AVG(s.duration) AS avg_duration
FROM songs s
JOIN albums a ON s.album_id = a.album_id
GROUP BY a.album_name;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.artist_name
FROM artists ar
WHERE ar.artist_id NOT IN (
    SELECT distinct aa.artist_id
    FROM artists_albums aa
    JOIN albums al ON aa.album_id = al.album_id
    WHERE al.release_year = '2020-01-01'
);

-- Названия сборников, в которых присутствует конкретный исполнитель
SELECT c.collection_name
FROM collections c
JOIN collections_songs cs ON c.collection_id = cs.collection_id
JOIN songs s ON cs.song_id = s.song_id
JOIN albums al ON s.album_id = al.album_id
JOIN artists_albums aa ON al.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE ar.artist_name = 'Queen';

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT a.album_name
FROM albums a
JOIN artists_albums aa ON a.album_id = aa.album_id
JOIN genres_artists ga ON aa.artist_id = ga.artist_id
GROUP BY a.album_name
HAVING COUNT(DISTINCT ga.genre_id) > 1;

-- Наименования треков, которые не входят в сборники
SELECT s.song_name
FROM songs s
LEFT JOIN collections_songs cs ON s.song_id = cs.song_id
WHERE cs.collection_id IS NULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT ar.artist_name
FROM artists ar
JOIN artists_albums aa ON ar.artist_id = aa.artist_id
JOIN albums al ON aa.album_id = al.album_id
JOIN songs s  ON al.album_id = s.album_id
WHERE s.duration = (SELECT MIN(duration) FROM songs);

-- Названия альбомов, содержащих наименьшее количество треков
SELECT a.album_name
FROM albums a
JOIN songs s ON a.album_id = s.album_id
GROUP BY a.album_name
HAVING COUNT(s.song_id) < (
  SELECT COUNT(s.song_id)
  FROM albums a
  JOIN songs s ON a.album_id = s.album_id
  GROUP BY a.album_name
  ORDER BY COUNT(s.song_id) ASC
  LIMIT 1
);