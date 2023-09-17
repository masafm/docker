<?php
$count = getenv('CURL_COUNT');
$url = getenv('CURL_TARGET_URL') ? getenv('CURL_TARGET_URL') : 'http://nginx:81/nginx_status';
$count = $count ? $count : 10;
for ($i = 1; $i <= $count; $i++) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    $res =  curl_exec($ch);
    curl_close($ch);
    var_dump($res);
}
?>
