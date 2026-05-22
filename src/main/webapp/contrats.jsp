<%@ page import="java.util.List, java.util.ArrayList, model.Contrat, model.Client, model.Voiture" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contrats</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<%@ include file="header.jsp" %>
<%
    @SuppressWarnings("unchecked")
    List<Contrat> liste = (List<Contrat>) request.getAttribute("listContrats");
    @SuppressWarnings("unchecked")
    List<Client> clients = (List<Client>) request.getAttribute("listClients");
    @SuppressWarnings("unchecked")
    List<Voiture> voitures = (List<Voiture>) request.getAttribute("listVoitures");
    if (liste == null) liste = new ArrayList<>();
%>
<div class="main-container">
    <div class="header">
        <h2>Gestion des Contrats</h2>
        <a class="btn" href="ContratAjouterForm">Ajouter</a>
    </div>
    <table>
        <tr>
            <th>Date Début</th>
            <th>Date Fin</th>
            <th>Montant Total</th>
            <th>Client</th>
            <th>Voiture</th>
            <th>Actions</th>
        </tr>
        <% for (Contrat ct : liste) {
            String nomClient = "";
            for (Client cl : clients) {
                if (cl.getId() == ct.getIdClient()) {
                    nomClient = cl.getNom() + " " + cl.getPrenom();
                    break;
                }
            }
            String nomVoiture = "";
            for (Voiture v : voitures) {
                if (v.getId() == ct.getIdVoiture()) {
                    nomVoiture = v.getMarque() + " " + v.getModele();
                    break;
                }
            }
        %>
        <tr>
            <td><%= ct.getDateDebut() %></td>
            <td><%= ct.getDateFin() %></td>
            <td><%= ct.getMontantTotal() %> MAD</td>
            <td><%= nomClient %></td>
            <td><%= nomVoiture %></td>
            <td>
                <a href="ContratEditer?id=<%= ct.getId() %>">
                    <img alt="edit" src="image/edit.png">
                </a>
                <a href="ContratSupprimer?id=<%= ct.getId() %>">
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