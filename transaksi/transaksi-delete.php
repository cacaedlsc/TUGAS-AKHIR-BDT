<?php
include "./../koneksi.php";

$id_transaksi = $_GET['id'];

$sql="DELETE FROM transaksi where id_transaksi='$id_transaksi'";

if(mysqli_query($link, $sql)){
    header("location: transaksi-tampil-data.php");
}
?>