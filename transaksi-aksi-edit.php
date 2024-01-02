<?php
include "koneksi.php";

$id_transaksi = $_POST['id_transaksi'];
$kode_plg = $_POST['kode_plg'];
$kode_brg = $_POST['kode_brg'];
$jumlah_beli = $_POST['jumlah_beli'];

// Tambahkan tanda kutip untuk menutup query Anda
$sql = "UPDATE transaksi SET kode_plg='$kode_plg', kode_brg='$kode_brg', jumlah_beli='$jumlah_beli' WHERE id_transaksi='$id_transaksi'";

if(mysqli_query($link, $sql)){
    header("location:transaksi-tampil-data.php");
} else {
    echo "Error: " . mysqli_error($link);
}

mysqli_close($link);
?>
