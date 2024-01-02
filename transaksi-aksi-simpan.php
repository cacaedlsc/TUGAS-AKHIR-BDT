<?php
include "koneksi.php";

// Ambil data dari form
$kode_plg = $_POST['kode_plg'];
$kode_brg = $_POST['kode_brg'];
$jumlah_beli = $_POST['jumlah_beli'];


$checkSql = "SELECT * FROM transaksi WHERE id_transaksi = '$id_transaksi'";
$checkResult = mysqli_query($link, $checkSql);


if (mysqli_num_rows($checkResult) > 0) {
    echo "<script>alert('Transaksi sudah ada dalam data, penyimpanan gagal dilakukan!'); window.location.href='buat_akun.html';</script>";
    exit; 
}


$sql = "INSERT INTO transaksi (kode_plg, kode_brg, jumlah_beli)
        VALUES ('$kode_plg', '$kode_brg', '$jumlah_beli')";

if(mysqli_query($link, $sql)){
    echo "<script>alert('Data Berhasil Disimpan!'); window.location.href='home.html';</script>";
} else {
    echo "<script>alert('Gagal menyimpan data!'); window.location.href='transaksi-buat-akun.html';</script>";
}

?>
