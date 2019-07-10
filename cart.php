<?php

$_COOKIE["PHPSESSID"] = "1tvl9ekhrcjbpnt4muipfu22rs";

session_start();

var_dump($_SESSION);

if (isset($_GET['book_id'])) {
    // Make sure it is a number I get
    $bookID = (int) $_GET['book_id'];
    // Make sure it's an number AND a valid ID
    $cart[] = $bookID;
}

$_SESSION["cart"] = $cart;

var_dump($_SESSION["cart"]);

echo '<hr>';

var_dump($_COOKIE);



/*



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

        h2, p {
            font-size: 0.75em;
        }

		#price {
			font-weight: 800;
			font-style: italic;
			font-size: 1em;
		}

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
    <?php
    
    foreach ($cart as $bookId) {
        echo $bookID;
        $sql_query = "SELECT * FROM books 
        WHERE book_id = $cart";				
        $result_query = mysqli_query($db_handle, $sql_query);				
        $db_record = mysqli_fetch_assoc($result_query);
        var_dump($db_record);
    }

    ?>
    
</body>
</html>

*/

?>