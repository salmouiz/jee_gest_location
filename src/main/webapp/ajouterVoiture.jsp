<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter une voiture</title>
    <link rel="stylesheet" href="style4.css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
    <h1>Ajouter une voiture</h1>
    <form action="VoitureAjouter" method="post">
        <div class="grid-container">
            <div class="champs">
                <label>Marque</label><br>
                <input type="text" name="marque">
            </div>
            <div class="champs">
                <label>Modèle</label><br>
                <input type="text" name="modele">
            </div>
            <div class="champs">
                <label>Immatriculation</label><br>
                <input type="text" name="immatriculation">
            </div>
            <div class="champs">
                <label>Prix par jour (MAD)</label><br>
                <input type="number" step="0.01" name="prixParJour">
            </div>
            <div class="champs">
                <label>Disponible</label><br>
                <input type="checkbox" name="disponible" checked style="width:auto">
            </div>
        </div>
        <input type="submit" value="Ajouter">
    </form>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>