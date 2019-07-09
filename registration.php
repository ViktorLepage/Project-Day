<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

<body>


    <?php
    if (isset($_POST['submit'])) {

        if (empty($_POST["firstname"])) {
            $nameErr = "First name is required";
        } else {
            $name = htmlspecialchars($_POST["firstname"], ENT_QUOTES);
        }
        if (empty($_POST["lastname"])) {
            $nameErr = "Last name is required";
        } else {
            $name = htmlspecialchars($_POST["lastname"], ENT_QUOTES);
        }
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

        echo "Welcome " . $_POST['firstname'];
        //echo "Your email address is: " . $_POST["mail"];
    }
    ?>

    <form action=# Method=POST>
        <input type="text" name="firstname" value="" placeholder="First Name"> <br>
        <p>
            <input type="text" name="lastname" value="" placeholder="Last Name"> <br>
            <p>
                <input type="mail" name="mail" value="" placeholder="Mail"> <br>
                <p>
                    <input type="password" name="password" value="" placeholder="Password"> <br>
                    <p>

                        <input type="password" name="passwordconfirmation" value="" placeholder="Password Confirmation"> <br>
                        <p>

                            <input type="submit" name="submit" value="submit">

    </form>

</body>

</html>