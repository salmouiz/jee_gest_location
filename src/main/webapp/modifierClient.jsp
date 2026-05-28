<%@ page import="model.Client" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>AysiCar | Modifier client</title></head>
<body>
<%@ include file="header.jsp" %>
<%
    Client cl = (Client) request.getAttribute("client");
    if (cl == null) { response.sendRedirect("ServletClient"); return; }
%>
<div class="main-content">
    <div class="page-label">Gestion Clients</div>
    <h1 class="page-title">Modifier Client #<%= cl.getId() %></h1>
    <div class="form-card">
        <form action="ClientModifier" method="post">
            <input type="hidden" name="id" value="<%= cl.getId() %>">
            <div class="form-section">
                <div class="section-title"><i class="fas fa-user"></i> Identité</div>
                <div class="form-grid">
                    <div class="field"><label>Nom</label><input type="text" name="nom" value="<%= cl.getNom() %>" required></div>
                    <div class="field"><label>Prénom</label><input type="text" name="prenom" value="<%= cl.getPrenom() %>" required></div>
                    <div class="field field-full"><label>CIN</label><input type="text" name="cin" value="<%= cl.getCin() %>" required></div>
                </div>
            </div>
            <div class="form-section">
                <div class="section-title"><i class="fas fa-address-card"></i> Contact</div>
                <div class="form-grid">
                    <div class="field field-full"><label>Email</label><input type="text" name="email" value="<%= cl.getEmail() %>" required></div>
                    <div class="field"><label>Téléphone</label><input type="text" name="telephone" value="<%= cl.getTelephone() %>" required></div>
                    <div class="field"><label>Ville</label><input type="text" name="ville" value="<%= cl.getVille() %>" required></div>
                </div>
            </div>
            <div class="form-actions">
                <a href="ServletClient" class="btn btn-secondary">Annuler</a>
                <button type="submit" class="btn btn-primary"><i class="fas fa-save" style="margin-right:0.5rem;"></i>Enregistrer</button>
            </div>
        </form>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>