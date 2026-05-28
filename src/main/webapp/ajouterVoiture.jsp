<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AysiCar | Nouvelle Voiture</title>
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

        .header { background: var(--noir); padding: 0; position: relative; }
        .header::after {
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
            font-size: 1.5rem;
            color: var(--blanc);
            letter-spacing: 2px;
        }
        .logo-text span { color: var(--or); font-weight: 400; }
        .header-tag {
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 3px;
            color: var(--gris);
            font-weight: 300;
        }

        .nav { background: var(--noir-soft); border-bottom: 1px solid var(--gris-fonce); }
        .nav-inner {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: flex;
        }
        .nav-link {
            color: var(--gris);
            text-decoration: none;
            font-size: 0.8rem;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            padding: 1.25rem 1.5rem;
            border-bottom: 2px solid transparent;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .nav-link:hover { color: var(--blanc); }
        .nav-link.active { color: var(--or); border-bottom-color: var(--or); }

        .main {
            max-width: 700px;
            margin: 3rem auto;
            padding: 0 2rem;
            flex: 1;
        }
        .page-header { margin-bottom: 2.5rem; }
        .page-label {
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 3px;
            color: var(--gris);
            font-weight: 500;
            margin-bottom: 0.75rem;
        }
        .page-title {
            font-family: 'Playfair Display', serif;
            font-size: 2.25rem;
            color: var(--noir);
            font-weight: 700;
            line-height: 1.2;
        }
        .page-title::after {
            content: '';
            display: block;
            width: 50px; height: 2px;
            background: var(--or);
            margin-top: 1rem;
        }

        .form-card {
            background: var(--blanc);
            border: 1px solid #e8e8e3;
            padding: 2.5rem;
            position: relative;
        }
        .form-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 3px;
            background: linear-gradient(90deg, var(--or), var(--or-clair), var(--or));
        }
        .form-section { margin-bottom: 2rem; }
        .section-title {
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            color: var(--gris);
            font-weight: 600;
            margin-bottom: 1.25rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .section-title i { color: var(--or); font-size: 0.875rem; }
        .form-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 1.25rem; }
        .field { position: relative; }
        .field label {
            display: block;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--noir);
            margin-bottom: 0.5rem;
        }
        .field input, .field select {
            width: 100%;
            padding: 0.875rem 1rem;
            border: 1px solid #ddd;
            border-radius: 0;
            font-size: 0.9375rem;
            font-family: 'Inter', sans-serif;
            color: var(--noir);
            background: var(--blanc);
            transition: all 0.3s ease;
        }
        .field input:focus, .field select:focus {
            outline: none;
            border-color: var(--or);
            box-shadow: 0 0 0 3px rgba(201, 169, 110, 0.1);
        }
        .field input::placeholder { color: var(--gris-clair); font-weight: 300; }

        .disponible-wrapper {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 0.875rem 1rem;
            border: 1px solid #ddd;
            background: var(--blanc);
            transition: border-color 0.3s ease;
        }
        .disponible-wrapper:focus-within {
            border-color: var(--or);
            box-shadow: 0 0 0 3px rgba(201, 169, 110, 0.1);
        }
        .disponible-wrapper input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: var(--or);
        }
        .disponible-wrapper label {
            font-size: 0.875rem;
            cursor: pointer;
            margin: 0;
            color: var(--noir);
        }

        .form-actions {
            display: flex;
            gap: 1rem;
            justify-content: flex-end;
            padding-top: 1.5rem;
            border-top: 1px solid #eee;
            margin-top: 1rem;
        }
        .btn {
            padding: 0.875rem 2rem;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            font-family: 'Inter', sans-serif;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        .btn-secondary {
            background: transparent;
            color: var(--gris);
            border: 1px solid #ddd;
        }
        .btn-secondary:hover { border-color: var(--noir); color: var(--noir); }
        .btn-primary { background: var(--noir); color: var(--blanc); }
        .btn-primary:hover { background: var(--or); color: var(--noir); }

        .footer {
            background: var(--noir);
            padding: 2rem;
            text-align: center;
            margin-top: auto;
        }
        .footer-line { width: 30px; height: 1px; background: var(--or); margin: 0 auto 1rem; }
        .footer-brand {
            font-family: 'Playfair Display', serif;
            color: var(--blanc);
            font-size: 1.125rem;
            letter-spacing: 2px;
            margin-bottom: 0.5rem;
        }
        .footer-copy { font-size: 0.75rem; color: var(--gris); letter-spacing: 1px; font-weight: 300; }

        @media (max-width: 768px) {
            .header-inner { padding: 1rem; }
            .nav-inner { padding: 0 1rem; overflow-x: auto; }
            .main { margin: 2rem auto; padding: 0 1rem; }
            .page-title { font-size: 1.75rem; }
            .form-card { padding: 1.5rem; }
            .form-grid { grid-template-columns: 1fr; }
            .form-actions { flex-direction: column; }
            .btn { width: 100%; text-align: center; justify-content: center; }
        }
    </style>
</head>
<body>

    <header class="header">
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

    <nav class="nav">
        <div class="nav-inner">
            <a href="ServletClient" class="nav-link"><i class="fas fa-users"></i> Clients</a>
            <a href="ServletVoiture" class="nav-link active"><i class="fas fa-car"></i> Véhicules</a>
            <a href="ServletContrat" class="nav-link"><i class="fas fa-file-contract"></i> Contrats</a>
            <a href="#" class="nav-link"><i class="fas fa-calendar"></i> Réservations</a>
        </div>
    </nav>

    <main class="main">
        <div class="page-header">
            <div class="page-label">Gestion Voitures</div>
            <h1 class="page-title">Nouvelle Voiture</h1>
        </div>

        <div class="form-card">
            <form action="VoitureAjouter" method="post">

                <div class="form-section">
                    <div class="section-title">
                        <i class="fas fa-car"></i> Informations véhicule
                    </div>
                    <div class="form-grid">
                        <div class="field">
                            <label>Marque</label>
                            <input type="text" name="marque" placeholder="Toyota" required>
                        </div>
                        <div class="field">
                            <label>Modèle</label>
                            <input type="text" name="modele" placeholder="Corolla" required>
                        </div>
                        <div class="field">
                            <label>Immatriculation</label>
                            <input type="text" name="immatriculation" placeholder="12345-A-1" required>
                        </div>
                        <div class="field">
                            <label>Prix par jour (MAD)</label>
                            <input type="number" step="0.01" name="prixParJour" placeholder="350.00" required>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <div class="section-title">
                        <i class="fas fa-info-circle"></i> Statut
                    </div>
                    <div class="disponible-wrapper">
                        <input type="checkbox" name="disponible" id="disponible" checked>
                        <label for="disponible">Véhicule disponible à la location</label>
                    </div>
                </div>

                <div class="form-actions">
                    <a href="ServletVoiture" class="btn btn-secondary">Annuler</a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Enregistrer
                    </button>
                </div>

            </form>
        </div>
    </main>

    <footer class="footer">
        <div class="footer-line"></div>
        <div class="footer-brand">AysiCar</div>
        <div class="footer-copy">© 2026 — Tous droits réservés</div>
    </footer>

</body>
</html>