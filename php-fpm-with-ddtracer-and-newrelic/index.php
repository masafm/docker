<?php
for ($i = 1; $i <= 10; $i++) {
    // Access to Nginx status page
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, "http://localhost:81/");
    $res =  curl_exec($ch);
    curl_close($ch);
    var_dump($res);
}
?>
