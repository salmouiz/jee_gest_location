<%@ page import="java.util.List, java.util.ArrayList, model.Voiture" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>AysiCar | Voitures</title></head>
<body>
<%@ include file="header.jsp" %>
<%
    List<Voiture> liste = (List<Voiture>) request.getAttribute("listVoitures");
    if (liste == null) liste = new ArrayList<>();
%>
<div class="main-content">
    <div class="page-label">Gestion</div>
    <h1 class="page-title">Voitures</h1>
    <div class="table-card">
        <div class="table-header">
            <div class="table-title">Parc automobile</div>
            <a href="VoitureAjouterForm" class="btn-add"><i class="fas fa-plus"></i> Nouvelle voiture</a>
        </div>
        <table>
            <tr>
                <th>Marque</th><th>Modèle</th><th>Immatriculation</th>
                <th>Prix/Jour</th><th>Disponible</th><th>Actions</th>
            </tr>
            <% for (Voiture v : liste) { %>
            <tr>
                <td><%= v.getMarque() %></td>
                <td><%= v.getModele() %></td>
                <td><%= v.getImmatriculation() %></td>
                <td><%= v.getPrixParJour() %> MAD</td>
                <td>
                    <% if (v.isDisponible()) { %>
                        <span style="color:#2e7d32; font-weight:600; font-size:0.8rem; text-transform:uppercase; letter-spacing:1px;"><i class="fas fa-check-circle"></i> Oui</span>
                    <% } else { %>
                        <span style="color:var(--rouge); font-weight:600; font-size:0.8rem; text-transform:uppercase; letter-spacing:1px;"><i class="fas fa-times-circle"></i> Non</span>
                    <% } %>
                </td>
                <td>
                    <a href="VoitureEditer?id=<%= v.getId() %>"><img alt="edit" src="image/edit.png"></a>
                    <a href="VoitureSupprimer?id=<%= v.getId() %>"><img alt="delete" src="image/delete.png"></a>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>