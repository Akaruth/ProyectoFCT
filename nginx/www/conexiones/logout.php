<?php
session_start();
// Codigo para deslogearse
session_unset(); 
session_destroy(); 
header("Location: ../index.php");
?>