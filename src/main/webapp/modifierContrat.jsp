<%@ page import="java.util.List, java.util.ArrayList, model.Contrat, model.Client, model.Voiture" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>AysiCar | Modifier contrat</title></head>
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
<div class="main-content">
    <div class="page-label">Gestion Contrats</div>
    <h1 class="page-title">Modifier Contrat #<%= ct.getId() %></h1>
    <div class="form-card">
        <form action="ContratModifier" method="post">
            <input type="hidden" name="id" value="<%= ct.getId() %>">
            <div class="form-section">
                <div class="section-title"><i class="fas fa-calendar"></i> Période de location</div>
                <div class="form-grid">
                    <div class="field"><label>Date Début</label><input type="date" name="dateDebut" value="<%= ct.getDateDebut() %>" required></div>
                    <div class="field"><label>Date Fin</label><input type="date" name="dateFin" value="<%= ct.getDateFin() %>" required></div>
                    <div class="field field-full"><label>Montant Total (MAD)</label><input type="number" step="0.01" name="montantTotal" value="<%= ct.getMontantTotal() %>" required></div>
                </div>
            </div>
            <div class="form-section">
                <div class="section-title"><i class="fas fa-link"></i> Association</div>
                <div class="form-grid">
                    <div class="field">
                        <label>Client</label>
                        <select name="idClient">
                            <% for (Client cl : clients) { %>
                            <option value="<%= cl.getId() %>" <%= cl.getId() == ct.getIdClient() ? "selected" : "" %>>
                                <%= cl.getNom() %> <%= cl.getPrenom() %>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="field">
                        <label>Voiture</label>
                        <select name="idVoiture">
                            <% for (Voiture v : voitures) { %>
                            <option value="<%= v.getId() %>" <%= v.getId() == ct.getIdVoiture() ? "selected" : "" %>>
                                <%= v.getMarque() %> <%= v.getModele() %> — <%= v.getImmatriculation() %>
                            </option>
                            <% } %>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-actions">
                <a href="ServletContrat" class="btn btn-secondary">Annuler</a>
                <button type="submit" class="btn btn-primary"><i class="fas fa-save" style="margin-right:0.5rem;"></i>Enregistrer</button>
            </div>
        </form>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>