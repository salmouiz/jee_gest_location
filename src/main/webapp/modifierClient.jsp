<%@ page import="model.Client" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier un client</title>
    <link rel="stylesheet" href="style4.css">
</head>
<body>
<%@ include file="header.jsp" %>
<%
    Client cl = (Client) request.getAttribute("client");
    if (cl == null) { response.sendRedirect("ServletClient"); return; }
%>
<div class="container">
    <h1>Modifier le client <%= cl.getId() %></h1>
    <form action="ClientModifier" method="post">
        <input type="hidden" name="id" value="<%= cl.getId() %>">
        <div class="grid-container">
            <div class="champs">
                <label>Nom</label><br>
                <input type="text" name="nom" value="<%= cl.getNom() %>">
            </div>
            <div class="champs">
                <label>Prénom</label><br>
                <input type="text" name="prenom" value="<%= cl.getPrenom() %>">
            </div>
            <div class="champs">
                <label>CIN</label><br>
                <input type="text" name="cin" value="<%= cl.getCin() %>">
            </div>
            <div class="champs">
                <label>Email</label><br>
                <input type="text" name="email" value="<%= cl.getEmail() %>">
            </div>
            <div class="champs">
                <label>Téléphone</label><br>
                <input type="text" name="telephone" value="<%= cl.getTelephone() %>">
            </div>
            <div class="champs">
                <label>Ville</label><br>
                <input type="text" name="ville" value="<%= cl.getVille() %>">
            </div>
        </div>
        <input type="submit" value="Modifier">
    </form>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>