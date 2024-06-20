select * from spotify_music

select count(*) as c, released_year
from spotify_music
group by released_year
order by c desc

--Q1.Find the number of tracks released each year?
SELECT released_year, COUNT(*) AS track_count
FROM spotify_music
GROUP BY released_year
ORDER BY released_year;

--Q2.Get the total number of streams for each year?
SELECT released_year, SUM(streams) AS total_streams
FROM spotify_music
GROUP BY released_year
ORDER BY released_year;

--Q3.Find the track with the highest number of streams?
SELECT track_name, artists_name, streams
FROM spotify_music
ORDER BY streams DESC
LIMIT 1;

--Q4.List all tracks by a specific artist (e.g., "Taylor Swift"):
SELECT track_name, released_year, streams
FROM spotify_music
WHERE artists_name LIKE '%Taylor Swift%';

--Q5.Find the top 5 most streamed tracks released in 2023?
SELECT track_name ,artists_name, streams
FROM spotify_music
WHERE released_year = 2023
ORDER BY streams DESC
LIMIT 5;

--Q6.Calculate the average danceability and energy for tracks in 2023?
SELECT AVG(danceability) AS avg_danceability, AVG(energy) AS avg_energy
FROM spotify_music
WHERE released_year = 2023;

--Q7.Find the artist with the most tracks in the dataset?
SELECT artists_name, COUNT(*) AS track_count
FROM spotify_music
GROUP BY artists_name
ORDER BY track_count DESC
LIMIT 1;

--Q8.Get the average number of streams per track for each year?
SELECT released_year, AVG(streams) AS avg_streams
FROM spotify_music
GROUP BY released_year
ORDER BY released_year;

--Q9.Find the top 3 artists with the highest total number of streams?
SELECT artists_name, SUM(streams) AS total_streams
FROM spotify_music
GROUP BY artists_name
ORDER BY total_streams DESC
LIMIT 3;

--Q10.Get the distribution of tracks across different keys?
SELECT key, COUNT(*) AS track_count
FROM spotify_music
GROUP BY key
ORDER BY track_count DESC;

--Q11.Find the average valence and danceability of tracks in minor keys?
SELECT AVG(valence) AS avg_valence, AVG(danceability) AS avg_danceability
FROM spotify_music
WHERE mode = 'Minor';

--Q12.List all tracks with more than 500 million streams?
SELECT track_name, artists_name, streams
FROM spotify_music
WHERE streams > 500000000;

--Q13.Find the tracks released in the first half of 2023 (January to June)?
SELECT track_name, artists_name, released_month, streams
FROM spotify_music
WHERE released_year = 2023 AND released_month BETWEEN 1 AND 6;

--Q14.Get the total number of tracks and average streams per track for each artist?
SELECT artists_name, COUNT(*) AS track_count, AVG(streams) AS avg_streams
FROM spotify_music
GROUP BY artists_name
ORDER BY avg_streams DESC;

--Q15.oldest track?
SELECT *
FROM spotify_music
ORDER BY released_year ASC, released_month ASC, released_day ASC
LIMIT 1;

--Q16.new track?
SELECT *
FROM spotify_music
ORDER BY released_year DESC, released_month DESC, released_day DESC
LIMIT 1;

SELECT *
FROM spotify_music
ORDER BY streams DESC
LIMIT 3;

SELECT *
FROM spotify_music
ORDER BY streams ASC
LIMIT 3;

--Q.most playlist appereance?
SELECT *,
       (in_spotify_playlists , in_apple_playlists , in_deezer_playlists) AS total_playlist_appearances
FROM spotify_music
ORDER BY total_playlist_appearances DESC
LIMIT 1;

--Q.Most Chart Appearances on Spotify?
SELECT *
FROM spotify_music
ORDER BY in_spotify_charts DESC
LIMIT 1;

--Q..Most Chart Appearances on Apple Music?
SELECT *
FROM spotify_music
ORDER BY in_apple_charts DESC
LIMIT 1;

--Q.Most Chart Appearances on Deezer?
SELECT *
FROM spotify_music
ORDER BY in_deezer_charts DESC
LIMIT 1;

--Q.querry for Most Chart Appearances on deezer?
SELECT *
FROM spotify_music
ORDER BY in_deezer_charts DESC
LIMIT 1;

--Q.querry for Most Chart Appearances on shazam chart ?
SELECT *
FROM spotify_music
ORDER BY in_shazam_charts DESC
LIMIT 3;

--Q.highest BPM.
SELECT *
FROM spotify_music
ORDER BY bpm DESC
LIMIT 1;

--Q.lower BPM?
SELECT *
FROM spotify_music
ORDER BY bpm ASC
LIMIT 1;

--Q.most common key?
SELECT key, COUNT(*) as key_count
FROM spotify_music
GROUP BY key
ORDER BY key_count DESC
LIMIT 1;

--Q.Most Common Mode?
SELECT mode, COUNT(*) as mode_count
FROM spotify_music
GROUP BY mode
ORDER BY mode_count DESC
LIMIT 1;

--Q.Highest Danceability?
SELECT *
FROM spotify_music
ORDER BY danceability DESC
LIMIT 1;

--Q.Highest Valence?
SELECT *
FROM spotify_music
ORDER BY valence DESC
LIMIT 1;

--Q.Highest Energy?
SELECT *
FROM spotify_music
ORDER BY energy DESC
LIMIT 1;

--Q.Most Acoustic Track?
SELECT *
FROM spotify_music
ORDER BY acousticness DESC
LIMIT 1;

--Q.Most Instrumental Track?
SELECT *
FROM spotify_music
ORDER BY instrumentalness DESC
LIMIT 1;

--Q.Most Collaborations?
SELECT *
FROM spotify_music
ORDER BY artist_count DESC
LIMIT 1;

--Q.popular colabrations?
SELECT *
FROM spotify_music
WHERE artist_count > 1
ORDER BY streams DESC
LIMIT 10;