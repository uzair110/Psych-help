<?php
 
    $servername = "us-cdbr-east-02.cleardb.com";
    $username = "b2e2dc12c82c3b";
    $password = "7e284b0e";
    $dbname = "heroku_c82c28fdbe3ee78";
    $table = ""; // lets create a table named Employees.
    // we will get actions from the app to do operations in the database...
    // echo json_encode('success');
    $action = $_POST['action'];
    // printf($action);
    // Create Connection
    $conn = mysqli_connect($servername, $username, $password, $dbname);
    // Check Connection
    if($conn->connect_error){
        die("Connection Failed: " . $conn->connect_error);
        return;
    }
    // echo "Connected successfully";

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
        // printf( $action);
        $Username = $_POST['Username'];
        $Password = $_POST['Password'];
        $sql = "SELECT Password from accounts where Username='$Username'" or die(mysqli_error($dbname));
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
        // echo json_encode('arham my frinds');
        // echo "success arham";
    }
    if("SIGN_IN" == $action){
        // printf( $action);
        $Username = $_POST['Username'];
        $Password = $_POST['Password'];
        $sql = "SELECT * from accounts where Username='$Username'" or die(mysqli_error($dbname));
        $result = mysqli_query($conn, $sql);
        $row = $result->fetch_assoc();
        
        $data = $row['Password'];
        if ($data === $Password){
            $dataObj = new \stdClass();
            $dataObj->username = $row['Username'];
            $dataObj->result = "success";
            $dataObj->aid = $row['AID'];
            $dataObj->userType = $row['User_type'];
            $resultJSON = json_encode($dataObj);
            echo $resultJSON;
        }
        else {
            $dataObj = new \stdClass();
            $dataObj->username = $row['Username'];
            $dataObj->result = "Auth Failure";
            $dataObj->aid = "NULL";
            $dataObj->userType = "NULL";
            $resultJSON = json_encode($dataObj);
            echo $resultJSON;
        }
        $conn->close();
    }  
    if ("SIGN_UP" == $action)
    {
        $Username = $_POST['Username'];
        $Password = $_POST['Password'];
        $User_type = $_POST['User_type'];
        $fname = $_POST['First_Name'];
        $lname = $_POST['Last_Name'];
        $city = $_POST['City'];
        
        $id = 'SELECT AID FROM accounts group by AID order by AID desc LIMIT 1';
        $result = mysqli_query($conn, $id);
        $row = mysqli_fetch_assoc($result);
        $last_id = $row['AID'];
        // echo json_encode((int)$last_id);
        (int)$AID = (int)$last_id + 1;
        // echo $AID;
        $sql = "INSERT INTO `accounts`
        (`Username`,
        `Password`,
        `User_type`,
        `AID`)
        VALUES
        ('$Username',
        '$Password',
        '$User_type',
        '$AID')";
        
        // echo mysqli_query($conn,$sql);
        if(mysqli_query($conn,$sql))
        {
        $last_uid = 'SELECT UID FROM user group by UID order by UID desc limit 1';
        $result1 = mysqli_query($conn, $last_uid);
        $row1 = mysqli_fetch_assoc($result1);
        $last_uid1 = $row1['UID'];
        $UID = (int)$last_uid1 + 1;
        echo $UID;
        $bool1 = 'False';
        $sql2 = "INSERT INTO user
        (`UID`,
        `First_Name`,
        `Last_name`,
        `Blacklist`,
        `City`,
        `AID`)
        VALUES
        ('$UID',
        '$fname',
        '$lname',
        '$bool1',
        '$city',
        '$AID')";
        if (mysqli_query($conn, $sql2))
        {
            echo "added into user";
        }
        else
        {echo "failed adding";}
        }
        else
        {
            echo "Error from PHP";
        }
        
         
        return;}
 if("ADD_PSYCH" == $action)
 {
     $fname = $_POST['First_Name'];
     $lname = $_POST['Last_Name'];
     $number = $_POST['Phone_Number'];
     $email = $_POST['email'];
     $address = $_POST['Address'];
     $city = $_POST['City'];
     $Counselling_index = $_POST['Counselling_Type'];
     if ($Counselling_index == '1')
    {
        $Counselling_Type = "Clinic Appointment";
    }
    else if ($Counselling_index == '0') 
    {
        $Counselling_Type = "On Call Counselling";
    }
    
    $add_query = "INSERT INTO `heroku_c82c28fdbe3ee78`.`psychologist`
                    (
                    `First_Name`,
                    `Last_Name`,
                    `Phone_Number`,
                    `email`,
                    `Address`,
                    `Counselling_Type`,
                    `City`)
                    VALUES
                    (
                    '$fname',
                    '$lname',
                    '$number',
                    '$email',
                    '$address',
                    '$Counselling_Type',
                    '$city')";
        if (mysqli_query($conn, $add_query))
        {
            echo "Successfully Added Psychologist";
        }
        else
        {
            echo "Adding Psych Failed";
        }
 }
 if("EDIT_PROFILE" == $action)
 {  
    $pid = $_POST['PID'];
    $fname = $_POST['First_Name'];
    $lname = $_POST['Last_Name'];
    $number = $_POST['Phone_Number'];
    $email = $_POST['email'];
    $address = $_POST['Address'];
    $city = $_POST['City'];
    $Counselling_index = $_POST['Counselling_Type']; 
     if ($Counselling_index == '1')
    {
        $Counselling_Type = "Clinic Appointment";
    }
    else if ($Counselling_index == '0') 
    {
        $Counselling_Type = "On Call Counselling";
    }
    $check2 = "SET FOREIGN_KEY_CHECKS = 0";
     if (mysqli_query($conn,$check2))
     {
         $sql = "UPDATE `heroku_c82c28fdbe3ee78`.`psychologist`
                SET
                `First_Name` = '$fname',
                `Last_Name` = '$lname',
                `Phone_Number` = '$number',
                `email` = '$email',
                `Address` = '$address',
                `Counselling_Type` = '$Counselling_Type',
                `City` = '$city'
                WHERE `PID` = '$pid'";
                
                if(mysqli_query($conn, $sql))
                {
                    echo "Successfully Updated Psychologist";
                }
                else
                {
                    echo "Update Failed";
                }
     }
     else
     {
         echo "constraint failed!";
     }
    
    
 }
 
 
 if( "DELETE_PSYCH" == $action)
 {
     $pid = $_POST['PID'];
     $check = "SET SQL_SAFE_UPDATES = 0";
     $check2 = "SET FOREIGN_KEY_CHECKS = 0";
     if (mysqli_query($conn,$check2))
     {
     $sql = "DELETE FROM `heroku_c82c28fdbe3ee78`.`psychologist`
     WHERE PID = '$pid'";
     if (mysqli_query($conn, $sql))
     {
         echo "Success Deletion";
     }
     else
     {
         echo "deleting failed!";
     } 
     }
     
         
    
 }
 
 if ("ADD_RATING_REVIEW" == $action)
 {
    $rating = floatval($_POST['rating']);
    $review = $_POST['review'];
    $uid = $_POST['uid'];
    $pid = (int)$_POST['pid'];
    $check2 = "SET FOREIGN_KEY_CHECKS = 0";
     if (mysqli_query($conn,$check2))
     {
         $sql = "INSERT INTO `heroku_c82c28fdbe3ee78`.`ratings`
                (
                `Rating`,
                `PID`,
                `UID`)
                VALUES
                (
                ('$rating'),
                '$pid',
                '$uid');";
                if (mysqli_query($conn,$sql))
                {
                    $get_ratingID = " SELECT Rating_ID FROM heroku_c82c28fdbe3ee78.ratings
                                      where UID = '$uid' and PID = '$pid' and Rating = '$rating' order by Rating_ID desc LIMIT 1;";
                       $result = mysqli_query($conn, $get_ratingID);
                       $row = mysqli_fetch_assoc($result);
                       $rid = $row['Rating_ID'];
                       if ($result != null)
                       {
                           $insert_review = "INSERT INTO `heroku_c82c28fdbe3ee78`.`reviews`
                                            (`Review`,
                                            `Upvote`,
                                            `Downvote`,
                                            `Rating_ID`)
                                            VALUES
                                            (
                                            '$review',
                                            2,
                                            2,
                                            '$rid');
                                            ";
                            if (mysqli_query($conn, $insert_review))
                            {
                                echo "Successfully inserted rating and review!";
                            }
                            else
                            {
                                echo "Error inserting review";
                            }
                       }
                }
                else
                {
                    echo "Error inserting rating";
                }
                
     }
     else
     {
         echo "Foriegn Key Constraint";
     }
    
 }
 
 if ("GET_RATING" == $action)
 {
     $pid = $_POST['PID'];
     $sql = "SELECT ROUND(avg(Rating),2) FROM heroku_c82c28fdbe3ee78.ratings
            where PID = '$pid' ;";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $rid = $row['ROUND(avg(Rating),2)'];
    echo $rid;
    }
 
 
 if("USR_DAT" == $action){
        // printf( $action);
        $AID = $_POST['aid'];
        $sql = "SELECT * from user where AID = '$AID'" or die(mysqli_error($dbname));
        $result = mysqli_query($conn, $sql);
        $row = $result->fetch_assoc();
        

        if (mysqli_query($conn,$sql)){
            $dataObj = new \stdClass();
            $dataObj->result = "success";
            $dataObj->uid = $row['UID'];
            $dataObj->firstName = $row['First_Name'];
            $dataObj->lastName = $row['Last_name'];
            $dataObj->blacklist = $row['Blacklist'];
            $dataObj->city = $row['City'];
            $resultJSON = json_encode($dataObj);
            echo $resultJSON;
        }
        else {
            $dataObj = new \stdClass();
            $dataObj->result = "Failed";
            $dataObj->uid = "NULL";
            $dataObj->firstName = "NULL";
            $dataObj->lastName = "NULL";
            $dataObj->blacklist = "NULL";
            $dataObj->city = "NULL";
            $resultJSON = json_encode($dataObj);
            echo $resultJSON;
        }
        $conn->close();
    }  

    if("MOD_DAT" == $action){
        // printf( $action);
        $AID = $_POST['aid'];
        $sql = "SELECT * from moderator where AID = '$AID'" or die(mysqli_error($dbname));
        $result = mysqli_query($conn, $sql);
        $row = $result->fetch_assoc();


        if (mysqli_query($conn,$sql)){
            $dataObj = new \stdClass();
            $dataObj->result = "success";
            $dataObj->mid = $row['MID'];
            $dataObj->firstName = $row['first_name'];
            $dataObj->lastName = $row['last_name'];
            $dataObj->modLevel = $row['Level'];
            $resultJSON = json_encode($dataObj);
            echo $resultJSON;
        }
        else {
            $dataObj = new \stdClass();
            $dataObj->result = "success";
            $dataObj->mid = $row['MID'];
            $dataObj->firstName = $row['first_name'];
            $dataObj->lastName = $row['last_name'];
            $dataObj->modLevel = $row['Level'];
            $resultJSON = json_encode($dataObj);
            echo $resultJSON;
        }
        $conn->close();
    }
        
    
    if ("PSYCH_SEARCH" == $action)
    {
        $name = $_POST['searchName'];
        
        $search_data = array();
        $search_list = array();
        $search_query = "SELECT * From psychologist
                        where First_Name LIKE '%$name%' OR Last_Name LIKE '%$name%' 
                        OR City LIKE '%$name%'";
        $result = $conn->query($search_query);
        if(!empty($result) && $result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $search_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($search_data);
        }else{
            echo json_encode("List is Empty");
        }
        $conn->close();
    }
   
    if ("ADD_SEARCH" == $action)
    {
        $searchQuery = $_POST['searchQuery'];
        $uid = $_POST['uid'];
        
        $search_data = array();
        $search_list = array();
        $count = 1;
        $search_query = "SELECT * From search_history WHERE UID = '$uid' and Search_Name = '$searchQuery';";
        $result = $conn->query($search_query);
        $res = $result->fetch_assoc();
        if($result->num_rows==0){
            $insert_query = "SET FOREIGN_KEY_CHECKS=0;";
            $insert_query .= "INSERT INTO `heroku_c82c28fdbe3ee78`.search_history (Search_Name, Counter, UID) VALUES ('$searchQuery',1,'$uid');";
            if ($conn->multi_query($insert_query)  == TRUE)//mysqli_query($conn, $insert_query))
            {
                echo "Successfully Added Search";
            }
            else
            {
                echo "Adding Search Failed";
            }
        }
        else
        {
            $newCount = $res['Counter']+1;
            $update_query = "UPDATE search_history SET Counter=$newCount WHERE UID = '$uid' and Search_Name = '$searchQuery';";
            if (mysqli_query($conn, $update_query))
            {
                echo "Successfully Updated Search";
            }
            else
            {
                echo "Updating Search Failed";
            }
        }
        $conn->close();
    }
    
    if ("PSYCH_SUG" == $action)
    {
        $uid = $_POST['uid'];
        
        $search_data = array();
        $search_list = array();
        $search_query = "SELECT * From search_history
                        where UID = '$uid'  ORDER BY Counter DESC ";
        $result = $conn->query($search_query);
        if(!empty($result) && $result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $search_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($search_data);
        }else{
            echo json_encode("List is Empty");
        }
        $conn->close();
    }
    
    if ("REV_COMPLAIN" == $action)
    {
        $search_data = array();
        $search_list = array();
        $search_query = "SELECT review_complaints.Rev_ID as rev_id, review_complaints.Complaint as complain, review_complaints.Complaint as cType, reviews.Review as rev FROM review_complaints LEFT JOIN reviews ON reviews.RID = review_complaints.RID ORDER BY review_complaints.Rev_ID;";
        $result = $conn->query($search_query);
        if(!empty($result) && $result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $search_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($search_data);
        }else{
            echo json_encode("List is Empty");
        }
        $conn->close();
    }
    
    if ("PSYCH_COMPLAIN" == $action)
    {
        $search_data = array();
        $search_list = array();
        $search_query = "SELECT psychologist_complaints.PID as pid, psychologist_complaints.UID as uid, psychologist_complaints.Complaint as complaint, psychologist.First_Name as firstName, psychologist.Last_Name as lastName FROM psychologist_complaints LEFT JOIN psychologist ON psychologist.PID = psychologist_complaints.PID ORDER BY psychologist_complaints.CID;";
        $result = $conn->query($search_query);
        if(!empty($result) && $result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $search_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($search_data);
        }else{
            echo json_encode("List is Empty");
        }
        $conn->close();
    }
    
    if ("PSYCH_REV_USR" == $action)
    {
        $pid = $_POST['pid'];
        
        $search_data = array();
        $search_list = array();
        $search_query = "Select u.UID, u.First_Name, p.First_Name as psyfirstName, p.Last_Name as psylastName, r.PID, (Rating), review, Upvote, downvote, r.Rating_ID 
			from ratings r
            inner join reviews re on
            re.Rating_ID = r.Rating_ID
            inner join user u on 
            u.UID = r.UID
            inner join psychologist p on 
            r.PID = p.PID
            where r.PID = '$pid';";
        $result = $conn->query($search_query);
        if(!empty($result) && $result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $search_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($search_data);
        }else{
            echo json_encode("List is Empty");
        }
        $conn->close();
    }    
    
    if ("REV_USR" == $action)
    {
        $uid = $_POST['uid'];
        
        $search_data = array();
        $search_list = array();
        $search_query = "Select u.UID, u.First_Name, p.First_Name as psyfirstName, p.Last_Name as psylastName, r.PID, (Rating), review, Upvote, downvote, r.Rating_ID 
			from ratings r
            inner join reviews re on
            re.Rating_ID = r.Rating_ID
            inner join user u on 
            u.UID = r.UID
            inner join psychologist p on 
            r.PID = p.PID
            where r.UID = '$uid';";
        $result = $conn->query($search_query);
        if(!empty($result) && $result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $search_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($search_data);
        }else{
            echo json_encode("List is Empty");
        }
        $conn->close();
    }
 
?>
