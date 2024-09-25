select * from bands;
select * from albums;
select * from songs;
#######3. Select only the names of all Bands from the songs table
Select Distinct b.name from songs s
Join albums a ON s.album_id = a.id
Join bands b ON a.band_id = b.id;

#####Select the oldest album.
Select * from albums where release_year IS NOT NULL ORDER BY release_year ASC LIMIT 1;

###### Get all the bands that have albums
Select Distinct b.name From bands b
Join albums a ON b.id = a.band_id;

######Get all the bands that have no albums
Select b.name From bands b
Left Join albums a ON b.id = a.band_id
Where a.band_id IS NULL;

#####7. Get the longest album
select id, name, release_year, band_id from albums 
order by LENGTH(name) DESC
LIMIT 1;

#####8. Insert a record for your favorite Band and one of their Albums
INSERT INTO bands(id,name) VALUES (200,'Bigil');
INSERT INTO albums(id, name, release_year, band_id) VALUES (201, 'GOD', 2008, 1);


#### Delete the Band and Album you added in previous question.
Delete from bands where id = 200;
Delete from albums where id = 201;

#### get the Average length of all songs
SELECT AVG(length) AS average_length FROM songs;

####### Select the longest song of each album
SELECT distinct a.id AS album_id, a.name AS album_name, 
s.length AS longest_song_length, s.name AS longest_song_name
FROM albums a
JOIN songs s 
ON s.album_id = a.id
JOIN (SELECT album_id, MAX(length) AS max_length FROM songs
GROUP BY album_id) AS max_songs
ON s.album_id = max_songs.album_id AND s.length = max_songs.max_length
ORDER BY a.id;

######  Get the number of songs for each band
SELECT b.name, COUNT(s.id) AS song_count
FROM bands b
JOIN albums a ON b.id = a.band_id
JOIN songs s ON a.id = s.album_id
GROUP BY b.id;


##### Create a decade column with dividing the year // 10 *10.
ALTER TABLE albums ADD COLUMN decade INT;
UPDATE albums
SET decade = (release_year DIV 10) * 10;



##### Filter the Albums which start with the word 'The'
Select * from albums
WHERE name LIKE 'The%';




##### Find the album which released in 2008 to 2013.
Select * from albums
Where release_year BETWEEN 2008 AND 2013;




















