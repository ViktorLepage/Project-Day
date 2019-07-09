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


    if (empty($_POST["mail"])) {
        $nameErr = "Your email is required";
    } else {
        $name = htmlspecialchars($_POST["mail"], ENT_QUOTES);
    }
    if (empty($_POST["password"])) {
        $nameErr = "Password is required";
    } else {
        $name = htmlspecialchars($_POST["password"], ENT_QUOTES);
    }

    $email = $_POST['mail'];

    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        //echo ("$email is a valid email address");
    } else {
        echo ("$email is not a valid email address");
    }

    echo "Welcome!";
    //echo "Your email address is: " . $_POST["mail"];
}
?>

<body>
    <form action=# Method=POST>
        <input type="mail" name="mail" value="" placeholder="Mail"> <br>
        <p>
            <input type="password" name="password" value="" placeholder="Passoword"> <br>
            <p>
                <input type="submit" name="submit" value="submit">
    </form>

</body>

</html>