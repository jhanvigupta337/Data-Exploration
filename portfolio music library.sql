select * from portfolio.dbo.spotify


--Looking for number of songs in each genre to determine the genre distribution in your music library.


select genre, count(*) as Songcount  
from portfolio.dbo.spotify
group by genre;

--Identify the top 10 most popular tracks based on the popularity score.

SELECT top 10 Track_Name, Artist_Name, Genre, Popularity
FROM portfolio.dbo.spotify
order by Popularity desc

--Calculate the average beats per minute (BPM) for each genre to identify the tempo characteristics of different genres.

select genre,avg(beats_per_minute) as Bpm
from portfolio.dbo.spotify
group by genre


--Analyze the average energy level for each genre to understand the energetic qualities of different genres.


select genre, avg(energy) as energylevel
from portfolio.dbo.spotify
group by genre

--Determine the loudest and quietest tracks in your music library based on the loudness (dB) value.

--Loudest

SELECT top 1 Track_Name, Artist_Name, Genre, Loudness_dB
FROM portfolio.dbo.spotify
order by loudness_dB desc

--Quietest

SELECT top 1 Track_Name, Artist_Name, Genre, Loudness_dB
FROM portfolio.dbo.spotify
order by loudness_dB asc

--Identify the top 10 artists with the highest average track popularity scores

SELECT top 10 Artist_Name, avg(popularity)as popularityscore
FROM portfolio.dbo.spotify
group by Artist_Name
order by popularityscore desc

--Analyze the distribution of track lengths and determine the average track length in your music library.

SELECT AVG(Length) AS AvgTrackLength, MIN(Length) AS MinTrackLength, MAX(Length) AS MaxTrackLength
FROM portfolio.dbo.spotify

-- Is there a correlation between beats per minute (BPM) and energy levels in songs? Can you determine if songs with higher BPM tend to have higher energy?

SELECT
    (SUM(CAST([Beats_Per_Minute] AS float) * CAST([Energy] AS float)) - 
     (SUM(CAST([Beats_Per_Minute] AS float)) * SUM(CAST([Energy] AS float))) / COUNT(*)) /
    (SQRT((SUM(CAST([Beats_Per_Minute] AS float) * CAST([Beats_Per_Minute] AS float)) - 
           (SUM(CAST([Beats_Per_Minute] AS float)) * SUM(CAST([Beats_Per_Minute] AS float))) / COUNT(*)) *
          (SUM(CAST([Energy] AS float) * CAST([Energy] AS float)) - 
           (SUM(CAST([Energy] AS float)) * SUM(CAST([Energy] AS float))) / COUNT(*))))
    AS Correlation
FROM
    portfolio.dbo.spotify;


--Are certain genres more danceable than others? Analyze the average danceability score for different genres.

select genre, avg(Danceability) as Avgdanceability
from portfolio.dbo.spotify
group by genre
order by Avgdanceability desc

-- Is there a relationship between valence and energy? Explore whether songs with higher valence also tend to have higher energy levels.

SELECT Valence, AVG(Energy) AS AverageEnergy
FROM portfolio.dbo.spotify
GROUP BY Valence
ORDER BY Valence;

--Investigate the relationship between liveness and popularity. Determine if live recordings or songs with a higher liveness score tend to be more popular.

SELECT Liveness, AVG(Popularity) AS AveragePopularity
FROM portfolio.dbo.spotify
GROUP BY Liveness
ORDER BY Liveness;

