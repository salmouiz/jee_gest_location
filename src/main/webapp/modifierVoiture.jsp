<%@ page import="model.Voiture" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>AysiCar | Modifier voiture</title></head>
<body>
<%@ include file="header.jsp" %>
<%
    Voiture v = (Voiture) request.getAttribute("voiture");
    if (v == null) { response.sendRedirect("ServletVoiture"); return; }
%>
<div class="main-content">
    <div class="page-label">Gestion Voitures</div>
    <h1 class="page-title">Modifier Voiture #<%= v.getId() %></h1>
    <div class="form-card">
        <form action="VoitureModifier" method="post">
            <input type="hidden" name="id" value="<%= v.getId() %>">
            <div class="form-section">
                <div class="section-title"><i class="fas fa-car"></i> Informations véhicule</div>
                <div class="form-grid">
                    <div class="field"><label>Marque</label><input type="text" name="marque" value="<%= v.getMarque() %>" required></div>
                    <div class="field"><label>Modèle</label><input type="text" name="modele" value="<%= v.getModele() %>" required></div>
                    <div class="field"><label>Immatriculation</label><input type="text" name="immatriculation" value="<%= v.getImmatriculation() %>" required></div>
                    <div class="field"><label>Prix par jour (MAD)</label><input type="number" step="0.01" name="prixParJour" value="<%= v.getPrixParJour() %>" required></div>
                </div>
            </div>
            <div class="form-section">
                <div class="section-title"><i class="fas fa-info-circle"></i> Statut</div>
                <div style="display:flex; align-items:center; gap:1rem; padding:0.875rem 1rem; border:1px solid #ddd;">
                    <input type="checkbox" name="disponible" id="disponible" <%= v.isDisponible() ? "checked" : "" %> style="width:18px; height:18px; cursor:pointer;">
                    <label for="disponible" style="font-size:0.875rem; cursor:pointer; margin:0;">Véhicule disponible à la location</label>
                </div>
            </div>
            <div class="form-actions">
                <a href="ServletVoiture" class="btn btn-secondary">Annuler</a>
                <button type="submit" class="btn btn-primary"><i class="fas fa-save" style="margin-right:0.5rem;"></i>Enregistrer</button>
            </div>
        </form>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>