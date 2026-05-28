<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AysiCar | Nouveau client</title>
</head>
<body>
<%@ include file="header.jsp" %>

<main class="main-content" style="max-width:700px;">
    <div class="page-label">Gestion Clients</div>
    <h1 class="page-title">Nouveau Client</h1>
    <div class="form-card">
        <form action="ClientAjouter" method="post" id="clientForm">
            <div class="form-section">
                <div class="section-title"><i class="fas fa-user"></i> Identité</div>
                <div class="form-grid">
                    <div class="field"><label>Nom</label><input type="text" name="nom" placeholder="Dupont" required></div>
                    <div class="field"><label>Prénom</label><input type="text" name="prenom" placeholder="Jean" required></div>
                    <div class="field field-full"><label>CIN</label><input type="text" name="cin" placeholder="AB123456" required></div>
                </div>
            </div>
            <div class="form-section">
                <div class="section-title"><i class="fas fa-address-card"></i> Contact</div>
                <div class="form-grid">
                    <div class="field field-full"><label>Email</label><input type="text" name="email" placeholder="jean.dupont@email.com" required></div>
                    <div class="field"><label>Téléphone</label><input type="text" name="telephone" placeholder="06 12 34 56 78" required></div>
                    <div class="field"><label>Ville</label><input type="text" name="ville" placeholder="Casablanca" required></div>
                </div>
            </div>
            <div class="form-actions">
                <a href="ServletClient" class="btn btn-secondary">Annuler</a>
                <button type="submit" class="btn btn-primary"><i class="fas fa-plus" style="margin-right:0.5rem;"></i>Enregistrer</button>
            </div>
        </form>
    </div>
</main>

<%@ include file="footer.jsp" %>
</body>
</html>