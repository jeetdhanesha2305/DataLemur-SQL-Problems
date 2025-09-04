
WITH unified_songs_data AS (

  (
    SELECT 
      user_id, 
      song_id, 
      song_plays
    FROM songs_history )
  UNION ALL (
    SELECT 
      user_id, 
      song_id, 
      1 AS song_plays
    FROM songs_weekly  
    WHERE 
      listen_time::DATE <= '2022-08-04' 
  )

)

SELECT 
  user_id, 
  song_id, 
  SUM(song_plays) AS song_plays
FROM unified_songs_data
GROUP BY user_id, song_id 
ORDER BY song_plays DESC



