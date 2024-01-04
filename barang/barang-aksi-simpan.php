<?php
include "./../koneksi.php";

// Ambil data dari form
$kode_brg = $_POST['kode_brg'];
$nama_brg = $_POST['nama_brg'];
$harga = $_POST['harga'];

// Query untuk memeriksa apakah id barang sudah ada
$checkSql = "SELECT * FROM barang WHERE id_barang = '$id_barang'";
$checkResult = mysqli_query($link, $checkSql);

// Penolakan jika id barang sudah ada
if (mysqli_num_rows($checkResult) > 0) {
    echo "<script>alert('Barang sudah ada dalam data, penyimpanan gagal dilakukan!'); window.location.href='buat_akun.html';</script>";
    exit; 
}

// Jika id barang belum ada maka proses berlanjut
$sql = "INSERT INTO barang (kode_brg, nama_brg, harga)
        VALUES ('$kode_brg', '$nama_brg', '$harga')";

if(mysqli_query($link, $sql)){
    echo "<script>alert('Data Berhasil Disimpan!'); window.location.href='home.html';</script>";
} else {
    echo "<script>alert('Gagal menyimpan data!'); window.location.href='barang-buat-akun.html';</script>";
}

?>
