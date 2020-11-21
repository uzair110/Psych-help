<?php
 
    $servername = "us-cdbr-east-02.cleardb.com";
    $username = "b2e2dc12c82c3b";
    $password = "7e284b0e";
    $dbname = "heroku_c82c28fdbe3ee78";
    $table = ""; // lets create a table named Employees.
 
    // we will get actions from the app to do operations in the database...
    $action = $_POST["action"];
    // printf($action)
    // Create Connection
    $conn = mysqli_connect($servername, $username, $password, $dbname);
    // Check Connection
    if($conn->connect_error){
        die("Connection Failed: " . $conn->connect_error);
        return;
    }
    echo "Connected successfully";

    // if("LOG_ISSUE" == $action){
    //     $Issue_logged_by = $_POST["Issue_logged_by"];
    //     $Location = $_POST["Location"];
    //     $Area = $_POST["Area"];
    //     $Category = $_POST["Category"];
    //     $Sub_Category = $_POST["Sub_Category"];
    //     $Description1 = $_POST["Description1"];
    //     $Description2 = $_POST["Description2"];
    //     $sql = "INSERT INTO issues (Issue_logged_by ,Branch_ID, Area, Category, Sub_Category, Description1,Description2,Current_Status) VALUES ('$Issue_logged_by','$Location','$Area','$Category','$Sub_Category','$Description1', '$Description2','Open')";
    //     $result = mysqli_query($conn, $sql);
    //     echo "success";
    //     $conn->close();
    //     return;
    // }

    if("VALIDATE_EMP" == $action){
        $Employee_ID = $_POST["Username"];
        $Password = $_POST["Password"];
        $sql = "SELECT Password from accounts where Username='$Employee_ID'" or die(mysqli_error($dbname));
        $result = mysqli_query($conn, $sql);
        $row = $result->fetch_assoc();
        
        $data = $row['Password'];
        if ($data === $Password){
            echo "success";
        }
        else {
            echo "Failed";
        }
        $conn->close();
        return;
    }

    // if("VALIDATE_EMP_ID" == $action){
    //     $Employee_ID = $_POST["Employee_ID"];
    //     $sql = "select count(*) from employee where Employee_ID='$Employee_ID'" or die(mysqli_error($dbname));
    //     $result = mysqli_query($conn, $sql);
    //     $row = $result->fetch_assoc();
    //     $data = $row['count(*)'];
    //     if ($data === '1'){
    //         echo "success";
    //     }
    //     else {
    //         echo "Failed";
    //     }
    //     $conn->close();
    //     return;
    // }

    // if("_GET_ALL_ISSUES_BY_EMP" == $action){
    //     $Employee_ID = $_POST["Employee_ID"];
    //     $db_data = array();
    //     $sql = "SELECT Issue_ID,Description1,Current_Status,Issue_Logged_Timestamp from Issues where Issue_logged_by='$Employee_ID'" or die(mysqli_error($dbname));
    //     $result = $conn->query($sql);
    //     if(!empty($result) && $result->num_rows > 0){
    //         while($row = $result->fetch_assoc()){
    //             $db_data[] = $row;
    //         }
    //         // Send back the complete records as a json
    //         echo json_encode($db_data);
    //     }else{
    //         echo "error";
    //     }
    //     $conn->close();
    //     return;
    // }

    // if("_GET_ALL_ISSUES" == $action){
    //     $db_data = array();
    //     $sql = "SELECT Issue_ID,Description1,Current_Status,Issue_Logged_Timestamp from Issues" or die(mysqli_error($dbname));
    //     $result = $conn->query($sql);
    //     if(!empty($result) && $result->num_rows > 0){
    //         while($row = $result->fetch_assoc()){
    //             $db_data[] = $row;
    //         }
    //         // Send back the complete records as a json
    //         echo json_encode($db_data);
    //     }else{
    //         echo "error";
    //     }
    //     $conn->close();
    //     return;
    // }


    // if("UPDATE_STATUS" == $action){
    //     // App will be posting these values to this server
    //     $Issue_ID = $_POST['Issue_ID'];
    //     $new_status = $_POST["new_status"];
    //     $sql = "UPDATE Issues SET Current_Status = '$new_status' WHERE Issue_ID = '$Issue_ID'";
    //     if($conn->query($sql) === TRUE){
    //         echo "success";
    //     }else{
    //         echo "error";
    //     }
    //     $conn->close();
    //     return;
    // }

 
?>
