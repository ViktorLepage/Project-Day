<!DOCTYPE html>
<html>

<head>
	<title>Book Details</title>	
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

	<h1>Book Details</h1>
	<hr>

	<?php

	if (isset($_GET['book_id'])) {
				// Make sure it is a number I get
		$bookID = (int) $_GET['book_id'];
		// Make sure it's an number AND a valid ID
		if ($bookID > 0) {
			require_once 'database.php';

			$db_handle = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD);
			$db_found = mysqli_select_db($db_handle, DB_NAME);

			if ($db_found) {

				$sql_query = "SELECT b.*, a.auth_firstname, a.auth_lastname, f.format_name
				FROM books b 
				INNER JOIN authors a ON a.author_id = b.author_id
				INNER JOIN formats f ON f.format_id = b.format_id
				WHERE book_id = $bookID";				
				$result_query = mysqli_query($db_handle, $sql_query);				
				$db_record = mysqli_fetch_assoc($result_query);
				// var_dump($db_record);
				echo "<article>";
				echo "<img src=" . $db_record['book_image'] . " />";
				echo "<div>";
				echo "<h2>" . $db_record['title'] . " (" . $db_record['auth_firstname'] . " " . $db_record['auth_lastname'] . ")<h2>";
				echo "<p>" . $db_record['book_blurb'] . "<p>";
				echo "<br>";
				echo "<p id='price'> Price: " . $db_record['price'] . "€<p>";
				echo "<p> Format: " . $db_record['format_name'] . "<p>";
				echo "<br>";
				echo "<a href=cart.php?book_id=" . $db_record['book_id'] . "> Add to Cart </a><br><br>";
				echo "<a href=products.php> Return to books List </a>";
				echo "</div>";
				echo "</article>";
			} else {
				echo 'DB not found (' . DB_NAME . ')';
			}
		} else {
			echo 'Something\'s wrong...';
			echo '<a href="./">Go Back</a>';
		}
	} else {
		echo 'Something\'s wrong...';
		echo '<a href="./">Go Back</a>';
	}

	?>


</body>

</html>