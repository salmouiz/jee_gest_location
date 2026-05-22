<%@ page import="java.util.List, java.util.ArrayList, model.Client, model.Voiture" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un contrat</title>
    <link rel="stylesheet" href="style4.css">
</head>
<body>
<%@ include file="header.jsp" %>
<%
    @SuppressWarnings("unchecked")
    List<Client> clients = (List<Client>) request.getAttribute("listClients");
    @SuppressWarnings("unchecked")
    List<Voiture> voitures = (List<Voiture>) request.getAttribute("listVoitures");
    if (clients == null) clients = new ArrayList<>();
    if (voitures == null) voitures = new ArrayList<>();
%>
<div class="container">
    <h1>Ajouter un contrat</h1>
    <form action="ContratAjouter" method="post">
        <div class="grid-container">
            <div class="champs">
                <label>Date Début</label><br>
                <input type="date" name="dateDebut">
            </div>
            <div class="champs">
                <label>Date Fin</label><br>
                <input type="date" name="dateFin">
            </div>
            <div class="champs">
                <label>Montant Total (MAD)</label><br>
                <input type="number" step="0.01" name="montantTotal">
            </div>
            <div class="champs">
                <label>Client</label><br>
                <select name="idClient">
                    <% for (Client cl : clients) { %>
                    <option value="<%= cl.getId() %>"><%= cl.getNom() %> <%= cl.getPrenom() %></option>
                    <% } %>
                </select>
            </div>
            <div class="champs">
                <label>Voiture</label><br>
                <select name="idVoiture">
                    <% for (Voiture v : voitures) { %>
                    <option value="<%= v.getId() %>"><%= v.getMarque() %> <%= v.getModele() %> - <%= v.getImmatriculation() %></option>
                    <% } %>
                </select>
            </div>
        </div>
        <input type="submit" value="Ajouter">
    </form>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>