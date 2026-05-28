<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AysiCar | Accueil</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="main-content" style="text-align: center; padding-top: 4rem;">
    <div class="page-label" style="text-align:center;">Bienvenue</div>
    <h1 style="font-family:'Playfair Display',serif; font-size:3rem; color:var(--noir); margin-bottom:0.5rem;">AysiCar</h1>
    <p style="color:var(--gris); font-size:1rem; letter-spacing:2px; text-transform:uppercase; margin-bottom:3rem;">Système de gestion de location</p>
    <div style="display:flex; justify-content:center; gap:2rem; flex-wrap:wrap; margin-top:2rem;">
        <a href="ServletVoiture" style="background:var(--blanc); border:1px solid #e8e8e3; padding:2.5rem 2rem; text-decoration:none; color:var(--noir); min-width:180px; position:relative; transition:all 0.3s ease;">
            <div style="font-size:2.5rem; color:var(--or); margin-bottom:1rem;"><i class="fas fa-car"></i></div>
            <div style="font-family:'Playfair Display',serif; font-size:1.25rem; margin-bottom:0.5rem;">Voitures</div>
            <div style="font-size:0.75rem; color:var(--gris); text-transform:uppercase; letter-spacing:1px;">Gérer le parc</div>
        </a>
        <a href="ServletClient" style="background:var(--blanc); border:1px solid #e8e8e3; padding:2.5rem 2rem; text-decoration:none; color:var(--noir); min-width:180px; position:relative; transition:all 0.3s ease;">
            <div style="font-size:2.5rem; color:var(--or); margin-bottom:1rem;"><i class="fas fa-users"></i></div>
            <div style="font-family:'Playfair Display',serif; font-size:1.25rem; margin-bottom:0.5rem;">Clients</div>
            <div style="font-size:0.75rem; color:var(--gris); text-transform:uppercase; letter-spacing:1px;">Gérer les clients</div>
        </a>
        <a href="ServletContrat" style="background:var(--blanc); border:1px solid #e8e8e3; padding:2.5rem 2rem; text-decoration:none; color:var(--noir); min-width:180px; position:relative; transition:all 0.3s ease;">
            <div style="font-size:2.5rem; color:var(--or); margin-bottom:1rem;"><i class="fas fa-file-contract"></i></div>
            <div style="font-family:'Playfair Display',serif; font-size:1.25rem; margin-bottom:0.5rem;">Contrats</div>
            <div style="font-size:0.75rem; color:var(--gris); text-transform:uppercase; letter-spacing:1px;">Gérer les locations</div>
        </a>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>