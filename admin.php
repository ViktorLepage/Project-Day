<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<?php
if (isset($_POST['submit'])) {

    require_once 'database.php';

    $db_handle = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD);
    $db_found = mysqli_select_db($db_handle, DB_NAME);
    if ($db_found) {
        $title = $_POST['title'];
        $categoryid = $_POST['category_id'];
        $formatid = $_POST['format_id'];
        $price = $_POST['price'];
        $authorid = $_POST['author_id'];
        $bookupdate = $_POST['book-pubdate'];

        $sql_query = "INSERT INTO books(`title`, `category_id`, `format_id`, `price`, `author_id`, `book_pubdate `) 
    VALUES('$title', $categoryid, $formatid, $price, $authorid, '$bookupdate')";
        $result_query = mysqli_query($db_handle, $sql_query);
    }
}
?>

<body>

    <form action="" METHOD=POST>

        <input type="text" name="title" placeholder="title">
        <input type="text" name="category_id" placeholder="category_id">
        <input type="text" name="format_id" placeholder="format_id">
        <input type="text" name="price" placeholder="price">
        <input type="text" name="author_id" placeholder="author_id">
        <input type="text" name="book_pubdate" placeholder="book_pubdate">
        <input type="submit" name="submit" placeholder="submit">
    </form>

</body>

</html>