<%@ page import="java.util.List, java.util.ArrayList, model.Client, model.Voiture" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AysiCar | Nouveau contrat</title>
    <style>
        .field select {
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%238a8a8a' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            padding-right: 2.5rem;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<%
    List<Client> clients = (List<Client>) request.getAttribute("listClients");
    List<Voiture> voitures = (List<Voiture>) request.getAttribute("listVoitures");
    if (clients == null) clients = new ArrayList<>();
    if (voitures == null) voitures = new ArrayList<>();
%>

<main class="main-content" style="max-width:700px;">
    <div class="page-label">Gestion Contrats</div>
    <h1 class="page-title">Nouveau Contrat</h1>
    <div class="form-card">
        <form action="ContratAjouter" method="post">
            <div class="form-section">
                <div class="section-title"><i class="fas fa-calendar-alt"></i> Période de location</div>
                <div class="form-grid">
                    <div class="field"><label>Date Début</label><input type="date" name="dateDebut" required></div>
                    <div class="field"><label>Date Fin</label><input type="date" name="dateFin" required></div>
                </div>
            </div>
            <div class="form-section">
                <div class="section-title"><i class="fas fa-coins"></i> Tarification</div>
                <div class="form-grid">
                    <div class="field field-full"><label>Montant Total (MAD)</label><input type="number" step="0.01" name="montantTotal" placeholder="0.00" required></div>
                </div>
            </div>
            <div class="form-section">
                <div class="section-title"><i class="fas fa-link"></i> Attribution</div>
                <div class="form-grid">
                    <div class="field">
                        <label>Client</label>
                        <select name="idClient" required>
                            <option value="" disabled selected>Choisir un client</option>
                            <% for (Client cl : clients) { %>
                            <option value="<%= cl.getId() %>"><%= cl.getNom() %> <%= cl.getPrenom() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="field">
                        <label>Voiture</label>
                        <select name="idVoiture" required>
                            <option value="" disabled selected>Choisir une voiture</option>
                            <% for (Voiture v : voitures) { %>
                            <option value="<%= v.getId() %>"><%= v.getMarque() %> <%= v.getModele() %> — <%= v.getImmatriculation() %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-actions">
                <a href="ServletContrat" class="btn btn-secondary">Annuler</a>
                <button type="submit" class="btn btn-primary"><i class="fas fa-plus"></i> Enregistrer</button>
            </div>
        </form>
    </div>
</main>

<%@ include file="footer.jsp" %>
</body>
</html>