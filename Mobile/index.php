<?php
include("config.php");

$minPrice = isset($_GET['minPrice']) ? $_GET['minPrice'] : 0;
$maxPrice = isset($_GET['maxPrice']) ? $_GET['maxPrice'] : 100000;

$query = "SELECT * FROM cars WHERE price BETWEEN $minPrice AND $maxPrice";
$result = mysqli_query($con, $query);

$cars = [];
while ($row = mysqli_fetch_assoc($result)) {
    $cars[] = $row;
}

echo json_encode(["data" => $cars]);
?>
