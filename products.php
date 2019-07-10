<!DOCTYPE html>
<html>
<head>
	<title>Product List</title>
	<style>
        * {
            font-family: Arial, Helvetica, sans-serif;
        }

		section {
			display: flex;
			flex-flow: row wrap;
		}

		article {
			display: flex;
			flex-direction: row;
			width: 300px;
			border: 1px solid black;
			padding: 0.5em;
			margin: 0.5em;
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
            height: 125px;
            width: 80px;
        }
    </style>
</head>
<body>
	<?php require_once 'navbar.html'; ?>

	<h1>Product list</h1>
	<hr>

	<?php 

	require_once 'database.php';

	$db_handle = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD);
	$db_found = mysqli_select_db($db_handle, DB_NAME);

	if($db_found) {

		$sql_query = 'SELECT * FROM booksshop ORDER BY title'; 

		$result_query = mysqli_query($db_handle, $sql_query);

		$sql_query = "SELECT b.*, a.auth_firstname, a.auth_lastname, f.format_name, c.category_name
				FROM books b 
				INNER JOIN authors a ON a.author_id = b.author_id
				INNER JOIN formats f ON f.format_id = b.format_id
				INNER JOIN categories c ON c.category_id = b.category_id
				ORDER BY title";				
				$result_query = mysqli_query($db_handle, $sql_query);		
		echo "<section>";
		while ($db_record = mysqli_fetch_assoc($result_query)) {
			echo "<article>";
			echo "<img src=" . $db_record['book_image'] . " />";
			echo "<div>";
			echo "<h2>" . $db_record['title'] . " (" . $db_record['auth_firstname'] . " " . $db_record['auth_lastname'] . ")<h2>";
			echo "<p id='price'> Price: " . $db_record['price'] . "€<p>";
			echo "<p> Format: " . $db_record['format_name'] . " || Category: " . $db_record['category_name'] . "<p>";
			echo "<a href=product.php?book_id=" . $db_record['book_id'] . "> See more Info </a><br><br>";
			echo "<a href=cart.php?book_id=" . $db_record['book_id'] . "> Add to Cart </a><br><br>";
			echo "</div>";
			echo "</article>";
		}		
		echo "</section>";

	} else {
		echo 'DB not found (' . DB_NAME . ')';
	}

	 ?>


</body>
</html>