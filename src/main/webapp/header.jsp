<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
    :root {
        --noir: #0a0a0a;
        --noir-soft: #141414;
        --gris-fonce: #1f1f1f;
        --gris: #8a8a8a;
        --gris-clair: #c4c4c4;
        --blanc: #ffffff;
        --blanc-casse: #f5f5f0;
        --or: #c9a96e;
        --or-clair: #e0c99e;
        --rouge: #c41e3a;
    }
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
        font-family: 'Inter', sans-serif;
        background: var(--blanc-casse);
        color: var(--noir);
        line-height: 1.6;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }
    .site-header {
        background: var(--noir);
        padding: 0;
        position: relative;
    }
    .site-header::after {
        content: '';
        position: absolute;
        bottom: 0; left: 0; right: 0;
        height: 1px;
        background: linear-gradient(90deg, transparent, var(--or), transparent);
    }
    .header-inner {
        max-width: 1200px;
        margin: 0 auto;
        padding: 1.25rem 2rem;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .logo { display: flex; align-items: center; gap: 0.875rem; }
    .logo-icon {
        width: 42px; height: 42px;
        border: 1.5px solid var(--or);
        border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        color: var(--or); font-size: 1rem;
    }
    .logo-text {
        font-family: 'Playfair Display', serif;
        font-size: 1.5rem; color: var(--blanc); letter-spacing: 2px;
    }
    .logo-text span { color: var(--or); font-weight: 400; }
    .header-tag {
        font-size: 0.7rem; text-transform: uppercase;
        letter-spacing: 3px; color: var(--gris); font-weight: 300;
    }
    .site-nav {
        background: var(--noir-soft);
        border-bottom: 1px solid var(--gris-fonce);
    }
    .nav-inner {
        max-width: 1200px; margin: 0 auto;
        padding: 0 2rem; display: flex; gap: 0;
    }
    .nav-link {
        color: var(--gris); text-decoration: none;
        font-size: 0.8rem; font-weight: 500;
        text-transform: uppercase; letter-spacing: 1.5px;
        padding: 1.25rem 1.5rem;
        border-bottom: 2px solid transparent;
        transition: all 0.3s ease;
        display: flex; align-items: center; gap: 0.5rem;
    }
    .nav-link:hover { color: var(--blanc); }
    .nav-link.active { color: var(--or); border-bottom-color: var(--or); }
    .main-content {
        max-width: 1200px; margin: 3rem auto;
        padding: 0 2rem; flex: 1; width: 100%;
    }
    .page-label {
        font-size: 0.7rem; text-transform: uppercase;
        letter-spacing: 3px; color: var(--gris);
        font-weight: 500; margin-bottom: 0.75rem;
    }
    .page-title {
        font-family: 'Playfair Display', serif;
        font-size: 2.25rem; color: var(--noir);
        font-weight: 700; line-height: 1.2;
        margin-bottom: 2.5rem;
    }
    .page-title::after {
        content: ''; display: block;
        width: 50px; height: 2px;
        background: var(--or); margin-top: 1rem;
    }
    .btn-add {
        padding: 0.75rem 1.5rem;
        background: var(--noir); color: var(--blanc);
        font-size: 0.8rem; font-weight: 600;
        text-transform: uppercase; letter-spacing: 1.5px;
        border: none; cursor: pointer;
        text-decoration: none;
        transition: all 0.3s ease;
        display: inline-flex; align-items: center; gap: 0.5rem;
    }
    .btn-add:hover { background: var(--or); color: var(--noir); }
    table { border-collapse: collapse; width: 100%; }
    th {
        background: var(--noir); color: var(--or);
        font-size: 0.75rem; text-transform: uppercase;
        letter-spacing: 1.5px; font-weight: 600;
        padding: 1rem 1.25rem; text-align: left;
    }
    td { padding: 1rem 1.25rem; border-bottom: 1px solid #e8e8e3; font-size: 0.9375rem; }
    tr:hover td { background: #fafafa; }
    .table-card {
        background: var(--blanc);
        border: 1px solid #e8e8e3;
        position: relative; overflow: hidden;
    }
    .table-card::before {
        content: ''; position: absolute;
        top: 0; left: 0; width: 100%; height: 3px;
        background: linear-gradient(90deg, var(--or), var(--or-clair), var(--or));
    }
    .table-header {
        display: flex; justify-content: space-between;
        align-items: center; padding: 1.5rem;
        border-bottom: 1px solid #e8e8e3;
    }
    .table-title {
        font-family: 'Playfair Display', serif;
        font-size: 1.25rem; color: var(--noir);
    }
    a > img { width: 22px; height: 22px; margin-right: 8px; opacity: 0.6; transition: opacity 0.2s; }
    a > img:hover { opacity: 1; }
    .form-card {
        background: var(--blanc);
        border: 1px solid #e8e8e3;
        padding: 2.5rem; position: relative;
        max-width: 700px;
    }
    .form-card::before {
        content: ''; position: absolute;
        top: 0; left: 0; width: 100%; height: 3px;
        background: linear-gradient(90deg, var(--or), var(--or-clair), var(--or));
    }
    .section-title {
        font-size: 0.7rem; text-transform: uppercase;
        letter-spacing: 2px; color: var(--gris);
        font-weight: 600; margin-bottom: 1.25rem;
        display: flex; align-items: center; gap: 0.5rem;
    }
    .section-title i { color: var(--or); font-size: 0.875rem; }
    .form-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 1.25rem; }
    .field { position: relative; }
    .field label {
        display: block; font-size: 0.75rem; font-weight: 600;
        text-transform: uppercase; letter-spacing: 1px;
        color: var(--noir); margin-bottom: 0.5rem;
    }
    .field input, .field select {
        width: 100%; padding: 0.875rem 1rem;
        border: 1px solid #ddd; border-radius: 0;
        font-size: 0.9375rem; font-family: 'Inter', sans-serif;
        color: var(--noir); background: var(--blanc);
        transition: all 0.3s ease;
    }
    .field input:focus, .field select:focus {
        outline: none; border-color: var(--or);
        box-shadow: 0 0 0 3px rgba(201, 169, 110, 0.1);
    }
    .field-full { grid-column: 1 / -1; }
    .form-section { margin-bottom: 2rem; }
    .form-actions {
        display: flex; gap: 1rem; justify-content: flex-end;
        padding-top: 1.5rem; border-top: 1px solid #eee; margin-top: 1rem;
    }
    .btn {
        padding: 0.875rem 2rem; font-size: 0.8rem;
        font-weight: 600; text-transform: uppercase;
        letter-spacing: 1.5px; border: none;
        cursor: pointer; transition: all 0.3s ease;
        font-family: 'Inter', sans-serif; text-decoration: none;
    }
    .btn-secondary { background: transparent; color: var(--gris); border: 1px solid #ddd; }
    .btn-secondary:hover { border-color: var(--noir); color: var(--noir); }
    .btn-primary { background: var(--noir); color: var(--blanc); }
    .btn-primary:hover { background: var(--or); color: var(--noir); }
    @media (max-width: 768px) {
        .header-inner { padding: 1rem; }
        .nav-inner { padding: 0 1rem; overflow-x: auto; }
        .main-content { margin: 2rem auto; padding: 0 1rem; }
        .page-title { font-size: 1.75rem; }
        .form-card { padding: 1.5rem; }
        .form-grid { grid-template-columns: 1fr; }
        .form-actions { flex-direction: column; }
        .btn { width: 100%; text-align: center; }
    }
</style>

<header class="site-header">
    <div class="header-inner">
        <div class="logo">
            <div class="logo-icon"><i class="fas fa-car-side"></i></div>
            <div>
                <div class="logo-text">Aysi<span>Car</span></div>
                <div class="header-tag">Location Premium</div>
            </div>
        </div>
    </div>
</header>
<nav class="site-nav">
    <div class="nav-inner">
        <a href="index.jsp" class="nav-link"><i class="fas fa-home"></i> Accueil</a>
        <a href="ServletVoiture" class="nav-link"><i class="fas fa-car"></i> Voitures</a>
        <a href="ServletClient" class="nav-link"><i class="fas fa-users"></i> Clients</a>
        <a href="ServletContrat" class="nav-link"><i class="fas fa-file-contract"></i> Contrats</a>
        <a href="#" class="nav-link"><i class="fas fa-envelope"></i> Contact</a>
    </div>
</nav>