<%@ page import="java.util.List, java.util.ArrayList, model.Client" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>AysiCar | Clients</title></head>
<body>
<%@ include file="header.jsp" %>
<%
    List<Client> liste = (List<Client>) request.getAttribute("listClients");
    if (liste == null) liste = new ArrayList<>();
%>
<div class="main-content">
    <div class="page-label">Gestion</div>
    <h1 class="page-title">Clients</h1>
    <div class="table-card">
        <div class="table-header">
            <div class="table-title">Liste des clients</div>
            <a href="ClientAjouterForm" class="btn-add"><i class="fas fa-plus"></i> Nouveau client</a>
        </div>
        <table>
            <tr>
                <th>Nom</th><th>Prénom</th><th>CIN</th>
                <th>Email</th><th>Téléphone</th><th>Ville</th><th>Actions</th>
            </tr>
            <% for (Client cl : liste) { %>
            <tr>
                <td><%= cl.getNom() %></td>
                <td><%= cl.getPrenom() %></td>
                <td><%= cl.getCin() %></td>
                <td><%= cl.getEmail() %></td>
                <td><%= cl.getTelephone() %></td>
                <td><%= cl.getVille() %></td>
                <td>
                    <a href="ClientEditer?id=<%= cl.getId() %>"><img alt="edit" src="image/edit.png"></a>
                    <a href="ClientSupprimer?id=<%= cl.getId() %>"><img alt="delete" src="image/delete.png"></a>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>