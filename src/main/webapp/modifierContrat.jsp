<%@ page import="java.util.List, java.util.ArrayList, model.Contrat, model.Client, model.Voiture" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier un contrat</title>
    <link rel="stylesheet" href="style4.css">
</head>
<body>
<%@ include file="header.jsp" %>
<%
    Contrat ct = (Contrat) request.getAttribute("contrat");
    if (ct == null) { response.sendRedirect("ServletContrat"); return; }
    @SuppressWarnings("unchecked")
    List<Client> clients = (List<Client>) request.getAttribute("listClients");
    @SuppressWarnings("unchecked")
    List<Voiture> voitures = (List<Voiture>) request.getAttribute("listVoitures");
    if (clients == null) clients = new ArrayList<>();
    if (voitures == null) voitures = new ArrayList<>();
%>
<div class="container">
    <h1>Modifier le contrat <%= ct.getId() %></h1>
    <form action="ContratModifier" method="post">
        <input type="hidden" name="id" value="<%= ct.getId() %>">
        <div class="grid-container">
            <div class="champs">
                <label>Date Début</label><br>
                <input type="date" name="dateDebut" value="<%= ct.getDateDebut() %>">
            </div>
            <div class="champs">
                <label>Date Fin</label><br>
                <input type="date" name="dateFin" value="<%= ct.getDateFin() %>">
            </div>
            <div class="champs">
                <label>Montant Total (MAD)</label><br>
                <input type="number" step="0.01" name="montantTotal" value="<%= ct.getMontantTotal() %>">
            </div>
            <div class="champs">
                <label>Client</label><br>
                <select name="idClient">
                    <% for (Client cl : clients) { %>
                    <option value="<%= cl.getId() %>"
                        <%= cl.getId() == ct.getIdClient() ? "selected" : "" %>>
                        <%= cl.getNom() %> <%= cl.getPrenom() %>
                    </option>
                    <% } %>
                </select>
            </div>
            <div class="champs">
                <label>Voiture</label><br>
                <select name="idVoiture">
                    <% for (Voiture v : voitures) { %>
                    <option value="<%= v.getId() %>"
                        <%= v.getId() == ct.getIdVoiture() ? "selected" : "" %>>
                        <%= v.getMarque() %> <%= v.getModele() %> - <%= v.getImmatriculation() %>
                    </option>
                    <% } %>
                </select>
            </div>
        </div>
        <input type="submit" value="Modifier">
    </form>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>