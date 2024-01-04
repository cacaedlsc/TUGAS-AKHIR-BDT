<?php
include "./../koneksi.php";

$id_pelanggan = $_POST['id_pelanggan'];
$kode_plg = $_POST['kode_plg'];
$nama_plg = $_POST['nama_plg'];

// Tambahkan tanda kutip untuk menutup query 
$sql = "UPDATE pelanggan SET kode_plg='$kode_plg', nama_plg='$nama_plg' WHERE id_pelanggan='$id_pelanggan'";

if(mysqli_query($link, $sql)){
    header("location:pelanggan-tampil-data.php");
} else {
    echo "Error: " . mysqli_error($link);
}

mysqli_close($link);
?>
