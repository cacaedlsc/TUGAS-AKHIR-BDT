<?php
include "koneksi.php";

$id_barang = $_POST['id_barang'];
$kode_brg = $_POST['kode_brg'];
$nama_brg = $_POST['nama_brg'];
$harga = $_POST['harga'];

// Tambahkan tanda kutip untuk menutup query Anda
$sql = "UPDATE barang SET kode_brg='$kode_brg', nama_brg='$nama_brg', harga='$harga' WHERE id_barang='$id_barang'";

if(mysqli_query($link, $sql)){
    header("location:barang-tampil-data.php");
} else {
    echo "Error: " . mysqli_error($link);
}

mysqli_close($link);
?>
