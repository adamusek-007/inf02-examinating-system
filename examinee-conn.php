<?php

const DB_HOST = "127.0.0.1";
const DB_USER = "examinee";
const DB_PASSWORD = "zaq1@WSX";
const DB_NAME = "zadania";
function getConnectionToDatabase(): PDO
{
    static $pdo;
    if (!$pdo) {
        try {$pdo = new PDO(
            sprintf("mysql:host=%s;dbname=%s;charset=UTF8", DB_HOST, DB_NAME),
            DB_USER,
            DB_PASSWORD,
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION] 
        ); } catch(PDOException) {
            echo "Nie można połączyć się z bazą danych.";
            exit;
        }
    }
    return $pdo;
}
?>