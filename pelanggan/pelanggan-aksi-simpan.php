<?php
include "./../koneksi.php";

// Ambil data dari form
$kode_plg = $_POST['kode_plg'];
$nama_plg = $_POST['nama_plg'];

// Query untuk memeriksa apakah id plg sudah ada
$checkSql = "SELECT * FROM pelanggan WHERE id_pelanggan = '$id_pelanggan'";
$checkResult = mysqli_query($link, $checkSql);

// Penolakan jika id plg sudah ada
if (mysqli_num_rows($checkResult) > 0) {
    echo "<script>alert('Pelanggan sudah ada dalam data, penyimpanan gagal dilakukan!'); window.location.href='buat_akun.html';</script>";
    exit; 
}

// Jika id plg belum ada maka proses berlanjut
$sql = "INSERT INTO pelanggan (kode_plg, nama_plg)
        VALUES ('$kode_plg', '$nama_plg')";

if(mysqli_query($link, $sql)){
    echo "<script>alert('Data Berhasil Disimpan!'); window.location.href='home.html';</script>";
} else {
    echo "<script>alert('Gagal menyimpan data!'); window.location.href='barang-buat-akun.html';</script>";
}

?>
