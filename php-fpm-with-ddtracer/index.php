<?php
for ($i = 1; $i <= 3; $i++) {
    // Access to Nginx status page
    var_dump(file_get_contents("http://localhost:81/"));
}
?>
