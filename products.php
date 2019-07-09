<!DOCTYPE html>
<html>
<head>
	<title>Product List</title>
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

		while ($db_field = mysqli_fetch_assoc($result_query)) {
			echo '<hr>'; 
			//echo $db_field['movie_id'] . '<br>'; 
			echo '<img href="' . $db_field['poster'] . '" alt="' . $db_field['title'] . '">';
			echo '<p><strong>Title : </strong>' . 
			'<a href="product.php?id=' . $db_field['movie_id'] . '">' . $db_field['title'] . '</a></p>'; 
			echo '<p><strong>Year of release : </strong>' . $db_field['release_year'] . '</p>';
		}


	} else {
		echo 'DB not found (' . DB_NAME . ')';
	}

	 ?>


</body>
</html>