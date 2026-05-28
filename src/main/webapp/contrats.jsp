<%@ page import="java.util.List, java.util.ArrayList, model.Contrat, model.Client, model.Voiture" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AysiCar | Contrats</title>
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
    if (clients == null) clients = new ArrayList<>();
    if (voitures == null) voitures = new ArrayList<>();
%>

<main class="main-content">
    <div class="page-label">Gestion</div>
    <h1 class="page-title">Contrats</h1>

    <div class="table-card">
        <div class="table-header">
            <div class="table-title">Liste des contrats</div>
            <a href="ContratAjouterForm" class="btn-add"><i class="fas fa-plus"></i> Nouveau contrat</a>
        </div>
        <table>
            <tr>
                <th>Date Début</th>
                <th>Date Fin</th>
                <th>Montant</th>
                <th>Client</th>
                <th>Voiture</th>
                <th>Actions</th>
            </tr>
            <% for (Contrat ct : liste) {
                String nomClient = "";
                for (Client cl : clients) {
                    if (cl.getId() == ct.getIdClient()) { nomClient = cl.getNom() + " " + cl.getPrenom(); break; }
                }
                String nomVoiture = "";
                for (Voiture v : voitures) {
                    if (v.getId() == ct.getIdVoiture()) { nomVoiture = v.getMarque() + " " + v.getModele(); break; }
                }
            %>
            <tr>
                <td><%= ct.getDateDebut() %></td>
                <td><%= ct.getDateFin() %></td>
                <td style="font-weight:600; color:var(--or);"><%= ct.getMontantTotal() %> MAD</td>
                <td><i class="fas fa-user" style="color:var(--gris); margin-right:6px;"></i><%= nomClient %></td>
                <td><i class="fas fa-car" style="color:var(--gris); margin-right:6px;"></i><%= nomVoiture %></td>
                <td>
                    <a href="ContratEditer?id=<%= ct.getId() %>"><img alt="edit" src="image/edit.png"></a>
                    <a href="ContratSupprimer?id=<%= ct.getId() %>"><img alt="delete" src="image/delete.png"></a>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</main>

<%@ include file="footer.jsp" %>
</body>
</html>