<?php

// Database configuration
$servername = "172.17.0.5"; // Replace with your database host
$username = "root"; // Replace with your database username
$password = "root"; // Replace with your database password
$dbname = "muruli"; // Replace with your database name

// Create a connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Get form data
    $name = $_POST['Name'];
    $mobile = $_POST['mobile'];
    $email = $_POST['email'];
    $password = $_POST['psw'];

    // Insert data into the database (example table name: users)
    $sql = "INSERT INTO users (Name, mobile, email, password) VALUES ('$name', '$mobile', '$email', '$password')";

    if ($conn->query($sql) === TRUE) {
        echo "Registration successful!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Remember to close the connection when you're done
$conn->close();

?>