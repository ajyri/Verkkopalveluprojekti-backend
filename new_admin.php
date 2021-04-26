<?php
    $username = 'admin';
    $password = password_hash('admin',PASSWORD_DEFAULT);

    $username2 = 'admin2';
    $password2 = password_hash('V€rkk0p4lv3lu',PASSWORD_DEFAULT);

    $sql = "INSERT INTO admin_kayttaja (kayttajanimi,salasana) VALUES ('$username', '$password')";
    $sql2 = "INSERT INTO admin_kayttaja (kayttajanimi,salasana) VALUES ('$username2', '$password2')";
    echo $sql;
    echo $sql2;







