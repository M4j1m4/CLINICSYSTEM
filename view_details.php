<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$database = "clinic_data";

$connection = new mysqli($servername, $username, $password, $database);

// Check connection
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

// Get PatientID from URL
if (isset($_GET['id']) && !empty($_GET['id'])) {
    $patientID = $connection->real_escape_string($_GET['id']);

    // Fetch patient details using Student_Num
    $query = "SELECT FirstName, MiddleInitial, LastName, email, Sex, Age, civil_status, ContactNumber, yearLevel, Program, specialCases
              FROM patients
              WHERE Student_Num = '$patientID'";  // Changed from $Student_Num to $patientID
    $result = $connection->query($query);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo "<h1>Patient Details</h1>";
        echo "<p><strong>First Name:</strong> " . htmlspecialchars($row['FirstName']) . "</p>";
        echo "<p><strong>Middle Initial:</strong> " . htmlspecialchars($row['MiddleInitial']) . "</p>";
        echo "<p><strong>Last Name:</strong> " . htmlspecialchars($row['LastName']) . "</p>";
        echo "<p><strong>Email:</strong> " . htmlspecialchars($row['email']) . "</p>";
        echo "<p><strong>Age:</strong> " . htmlspecialchars($row['Age']) . "</p>";
        echo "<p><strong>Civil Status:</strong> " . htmlspecialchars($row['civil_status']) . "</p>";
        echo "<p><strong>Contact Number:</strong> " . htmlspecialchars($row['ContactNumber']) . "</p>";
        echo "<p><strong>Year Level:</strong> " . htmlspecialchars($row['yearLevel']) . "</p>";
        echo "<p><strong>Program:</strong> " . htmlspecialchars($row['Program']) . "</p>";
        echo "<p><strong>Special Case:</strong> " . htmlspecialchars($row['specialCases']) . "</p>";
    } else {
        echo "<p>No details found for the given Patient ID.</p>";
    }
} else {
    echo "<p>No Patient ID provided.</p>";
}

$connection->close();
?>
