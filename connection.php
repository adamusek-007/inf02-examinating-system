<?php

const DB_HOST = "127.0.0.1";
const DB_USER = "operator";
const DB_PASSWORD = "xsw2#EDC";
const DB_NAME = "zadania";
/**
 * Connects to Database
 */
function getConnectionToDatabase(): PDO
{


    static $pdo;
    if (!$pdo) {
        return new PDO(
            sprintf("mysql:host=%s;dbname=%s;charset=UTF8", DB_HOST, DB_NAME),
            DB_USER,
            DB_PASSWORD,
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
        );
    }
    return $pdo;
}
?>