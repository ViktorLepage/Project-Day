<?php

session_start();

if (isset($_GET['book_id'])) {
    // Make sure it is a number I get
    $bookID = (int) $_GET['book_id'];
    if (!isset($_SESSION['cart'])) {
        $cart = array($bookId);
        $_SESSION['cart'] = $cart;
    } else {
        $cart = $_SESSION['cart'];
        $cart[] = $bookID;
        $_SESSION['cart'] = $cart;
    }
}

$_SESSION["cart"] = $cart;

echo '<hr>';

require_once 'database.php';
$db_handle = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD);
$db_found = mysqli_select_db($db_handle, DB_NAME);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cart</title>

    <style>
        * {
            font-family: Arial, Helvetica, sans-serif;
        }

        article {
            display: flex;
            flex-direction: row;
            width: 50%;
            border: 1px solid black;
            padding: 0.5em;
            text-align: right;
        }

        div {
            padding: 0.5em;
        }

        h2,
        p {
            font-size: 0.75em;
        }

		#price {
			font-weight: 800;
			font-style: italic;
			font-size: 1em;

        img {

            height: 250px;
            width: 150px;
		}
    </style>
</head>

<body>
    <?php require_once 'navbar.html'; ?>

    <h1>Your Cart</h1>
    <hr>
    <table>
        <tr>
            <td>Book Title</td>
            <td>Price</td>
        </tr>

    <?php
    $totprice = 0;
    foreach ($cart as $item) { 
    $sql_query = "SELECT title, price FROM books 
        WHERE book_id = $item";
    $result_query = mysqli_query($db_handle, $sql_query);
    $db_record = mysqli_fetch_assoc($result_query);
    $totprice += $db_record['price'];
    echo "<tr><td>" . $db_record['title'] . "</td><td>" . $db_record['price'] . "</td></tr>";
    }
    echo "<tr><td>Total price of your order:</td><td>" . $totprice . "</td></tr>";
    ?>
    </table>
</body>

</html>