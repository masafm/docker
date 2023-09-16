<?php
$count = getenv('CURL_COUNT');
$count = $count ? $count : 10;
for ($i = 1; $i <= $count; $i++) {
    // Access to Nginx status page
    $ch = curl_init();
    //curl_setopt($ch, CURLOPT_URL, "http://localhost:81/nginx_status");
    curl_setopt($ch, CURLOPT_URL, "https://o8oxu72lo3.execute-api.ap-northeast-1.amazonaws.com/default");//Private API GW
    $res =  curl_exec($ch);
    curl_close($ch);
    var_dump($res);
}
?>
