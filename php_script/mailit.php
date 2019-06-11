<!-- Was hosted on a bluehost server, haha, cause thats what we had at the time -->
<?php
    $name=$_POST['name'];
    $issue_title=$_POST['issue_title'];
    $issue_desc=$_POST['issue_desc'];
    $incentive=$_POST['incentive'];
    $passphrase = $_POST['guessthis'];


    if ($passphrase == 'lighthouse') {
        $email='james@snowanalytics.ca';
        $kevin_phone = '7782410474@txt.windmobile.ca';
        $kevin_email = 'kbluescode@gmail.com';
        $james_email = 'james.matsuba@gmail.com';
        $jody_email = 'jody.a.chambers@gmail.com';

        $to = "$james_email,$jody_email,$kevin_phone,$kevin_email";
        $to1 = "$james_email,$jody_email";

        $message= "Hi Kevin,\nYou have a new help request from $name. \nRequest Details \nIssue Title: $issue_title \nIssue Description: $issue_desc \nIncentive: $incentive  \nThanks for Using Call Kevin";

        $from="From: $name<$email>\r\nReturn-path: $email";
        $subject="Call Kevin Help Request from $name";
        mail($to, $subject, $message, $from);


        echo "email sent";

        header('HTTP/1.1 307 Temporary Redirect');
        header('Location: https://callkevin.herokuapp.com/kevinrequest/new');
    } else {
        header("Location: https://callkevin.herokuapp.com/wrongpassword");
    }

?>
