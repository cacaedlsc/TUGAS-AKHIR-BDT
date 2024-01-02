<?php
include "koneksi.php";

$id_pelanggan = $_GET['id'];

$sql="DELETE FROM pelanggan where id_pelanggan='$id_pelanggan'";

if(mysqli_query($link, $sql)){
    header("location: pelanggan-tampil-data.php");
}
?>