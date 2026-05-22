<%@ page import="java.util.List, java.util.ArrayList, model.Voiture" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Voitures</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<%@ include file="header.jsp" %>
<%
    @SuppressWarnings("unchecked")
    List<Voiture> liste = (List<Voiture>) request.getAttribute("listVoitures");
    if (liste == null) liste = new ArrayList<>();
%>
<div class="main-container">
    <div class="header">
        <h2>Gestion des Voitures</h2>
        <a class="btn" href="VoitureAjouterForm">Ajouter</a>
    </div>
    <table>
        <tr>
            <th>Marque</th>
            <th>Modèle</th>
            <th>Immatriculation</th>
            <th>Prix/Jour</th>
            <th>Disponible</th>
            <th>Actions</th>
        </tr>
        <% for (Voiture v : liste) { %>
        <tr>
            <td><%= v.getMarque() %></td>
            <td><%= v.getModele() %></td>
            <td><%= v.getImmatriculation() %></td>
            <td><%= v.getPrixParJour() %> MAD</td>
            <td><%= v.isDisponible() ? "Oui" : "Non" %></td>
            <td>
                <a href="VoitureEditer?id=<%= v.getId() %>">
                    <img alt="edit" src="image/edit.png">
                </a>
                <a href="VoitureSupprimer?id=<%= v.getId() %>">
                    <img alt="delete" src="image/delete.png">
                </a>
            </td>
        </tr>
        <% } %>
    </table>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>