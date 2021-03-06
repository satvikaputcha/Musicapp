<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "musicdb";
 

$conn = new mysqli($servername, $username, $password, $database);
 
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
 
$data = array(); 
 
//this is our sql query 
$sql = "SELECT songname, AlbumId, likes_song, SongId, duration FROM song;";
 
//creating an statment with the query
$stmt = $conn->prepare($sql);
 
//executing that statment
$stmt->execute();
 
//binding results for that statment 
$stmt->bind_result($songname, $AlbumId, $likes_song, $SongId, $duration);
 
//looping through all the records
while($stmt->fetch()){
 
 //pushing fetched data in an array 
 $temp = [
 'songname'=>$songname,
 'AlbumId'=>$AlbumId,
 'likes_song'=>$likes_song,
 'SongId'=>$SongId,
 'duration'=>$duration
 ];
 
 //pushing the array inside the hero array 
 array_push($data, $temp);
}
 
//displaying the data in json format 
echo json_encode($data);
