<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un client</title>
    <link rel="stylesheet" href="style4.css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
    <h1>Ajouter un client</h1>
    <form action="ClientAjouter" method="post">
        <div class="grid-container">
            <div class="champs">
                <label>Nom</label><br>
                <input type="text" name="nom">
            </div>
            <div class="champs">
                <label>Prénom</label><br>
                <input type="text" name="prenom">
            </div>
            <div class="champs">
                <label>CIN</label><br>
                <input type="text" name="cin">
            </div>
            <div class="champs">
                <label>Email</label><br>
                <input type="text" name="email">
            </div>
            <div class="champs">
                <label>Téléphone</label><br>
                <input type="text" name="telephone">
            </div>
            <div class="champs">
                <label>Ville</label><br>
                <input type="text" name="ville">
            </div>
        </div>
        <input type="submit" value="Ajouter">
    </form>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>