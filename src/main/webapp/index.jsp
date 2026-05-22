<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion Location Voiture</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .cards {
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 60px 20px;
        }
        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 40px 30px;
            text-align: center;
            width: 200px;
            text-decoration: none;
            color: #333;
            font-size: 18px;
            font-weight: bold;
            transition: transform 0.2s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card .icon {
            font-size: 48px;
            margin-bottom: 15px;
        }
        .welcome {
            text-align: center;
            padding: 40px;
            color: #3f5c7a;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="welcome">
    <h1>Bienvenue dans le système de gestion de location</h1>
    <p>Choisissez un module pour commencer</p>
</div>

<div class="cards">
    <a class="card" href="ServletVoiture">
        <div class="icon">🚗</div>
        Voitures
    </a>
    <a class="card" href="ServletClient">
        <div class="icon">👤</div>
        Clients
    </a>
    <a class="card" href="ServletContrat">
        <div class="icon">📋</div>
        Contrats
    </a>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>