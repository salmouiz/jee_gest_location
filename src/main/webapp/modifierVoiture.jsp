<%@ page import="model.Voiture" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier une voiture</title>
    <link rel="stylesheet" href="style4.css">
</head>
<body>
<%@ include file="header.jsp" %>
<%
    Voiture v = (Voiture) request.getAttribute("voiture");
    if (v == null) { response.sendRedirect("ServletVoiture"); return; }
%>
<div class="container">
    <h1>Modifier la voiture <%= v.getId() %></h1>
    <form action="VoitureModifier" method="post">
        <input type="hidden" name="id" value="<%= v.getId() %>">
        <div class="grid-container">
            <div class="champs">
                <label>Marque</label><br>
                <input type="text" name="marque" value="<%= v.getMarque() %>">
            </div>
            <div class="champs">
                <label>Modèle</label><br>
                <input type="text" name="modele" value="<%= v.getModele() %>">
            </div>
            <div class="champs">
                <label>Immatriculation</label><br>
                <input type="text" name="immatriculation" value="<%= v.getImmatriculation() %>">
            </div>
            <div class="champs">
                <label>Prix par jour (MAD)</label><br>
                <input type="number" step="0.01" name="prixParJour" value="<%= v.getPrixParJour() %>">
            </div>
            <div class="champs">
                <label>Disponible</label><br>
                <input type="checkbox" name="disponible"
                       <%= v.isDisponible() ? "checked" : "" %> style="width:auto">
            </div>
        </div>
        <input type="submit" value="Modifier">
    </form>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>