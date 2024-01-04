<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Patrick Star</title>
<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(to right, #ff9a9e, #fad0c4);
    color: #333;
    padding-top: 120px; /* Adjusted for the navbar height */
    text-align: center;
  }
  .navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background-color: maroon;
    padding: 10px 0;
    text-align: center;
    color: #fff;
    font-size: 24px;
    font-weight: bold;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
  }
  .section {
    margin-top: 50px;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  h2 {
    color: maroon;
    margin-bottom: 20px;
  }
  .customform {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  input[type="text"],
  input[type="email"],
  input[type="password"],
  select {
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
    border: 1px solid #ccc;
    width: 300px;
    font-size: 16px;
    box-sizing: border-box;
  }
  .submit-form {
    padding: 12px 24px;
    font-size: 18px;
    margin-top: 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    background-color: maroon;
    color: #fff;
    transition: background-color 0.3s ease;
  }
  .submit-form:hover {
    background-color: #8b0000;
  }
  .footer {
    width: 100%;
    text-align: center;
    position: fixed; 
    bottom: 0; 
    left: 0; 
  }

  .footer-text {
    float: center;
  }
</style>
</head>
<body>

<div class="navbar">ELEKTRONIKA PATRICK STAR</div>

<?php
    include "./../koneksi.php";
    $id_pelanggan = $_GET['id'];
    $sql = "SELECT * FROM pelanggan WHERE id_pelanggan='$id_pelanggan'";
    $result = mysqli_query($link, $sql);
    $data = mysqli_fetch_assoc($result);
    ?>

<form method="POST" action="pelanggan-aksi-edit.php" class="customform">
        <input type="hidden" name="id_pelanggan" value="<?php echo $data['id_pelanggan']; ?>">
        
        <input name="kode_plg" class="required" placeholder="Masukkan Kode Pelanggan" title="Kode Pelanggan" type="text" value="<?php echo $data['kode_plg']; ?>" required/>
        <input name="status" type="hidden" value="ok"/>
        <input name="nama_plg" class="required" placeholder="Masukkan Nama Pelanggan" title="Nama Pelanggan" type="text" value="<?php echo $data['nama_plg']; ?>" required/>
     
        
        <button class="submit-form" type="submit">Simpan Perubahan</button>
    </form>
</section>
<!-- footer -->
<footer class="footer">
  <div class="footer-text">
      <p>Copyright &copy; 2023 by Caca E | All Rights Reserved.</p>
  </div>
</footer>
</body>
</html>
