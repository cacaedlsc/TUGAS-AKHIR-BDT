<?php
include "./../koneksi.php";

$id_barang = $_GET['id'];

$sql="DELETE FROM barang where id_barang='$id_barang'";

if(mysqli_query($link, $sql)){
    header("location: barang-tampil-data.php");
}
?>