package controller;

import dao.VoitureDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Voiture;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/ServletVoiture", "/VoitureEditer", "/VoitureSupprimer",
        "/VoitureAjouterForm", "/VoitureAjouter", "/VoitureModifier"})
public class ServletVoiture extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VoitureDAO dao;

    public ServletVoiture() {
        super();
        dao = new VoitureDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/ServletVoiture":
                List<Voiture> liste = dao.selectAll();
                request.setAttribute("listVoitures", liste);
                request.getRequestDispatcher("voitures.jsp").forward(request, response);
                break;
            case "/VoitureEditer":
                int id = Integer.parseInt(request.getParameter("id"));
                Voiture v = dao.getById(id);
                if (v == null) { response.sendRedirect("ServletVoiture"); return; }
                request.setAttribute("voiture", v);
                request.getRequestDispatcher("modifierVoiture.jsp").forward(request, response);
                break;
            case "/VoitureSupprimer":
                int id1 = Integer.parseInt(request.getParameter("id"));
                dao.delete(id1);
                response.sendRedirect("ServletVoiture");
                break;
            case "/VoitureAjouterForm":
                request.getRequestDispatcher("ajouterVoiture.jsp").forward(request, response);
                break;
            default:
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/VoitureAjouter":
                Voiture v = new Voiture();
                v.setMarque(request.getParameter("marque"));
                v.setModele(request.getParameter("modele"));
                v.setImmatriculation(request.getParameter("immatriculation"));
                v.setPrixParJour(Double.parseDouble(request.getParameter("prixParJour")));
                v.setDisponible(request.getParameter("disponible") != null);
                dao.add(v);
                response.sendRedirect("ServletVoiture");
                break;
            case "/VoitureModifier":
                Voiture v1 = new Voiture();
                v1.setId(Integer.parseInt(request.getParameter("id")));
                v1.setMarque(request.getParameter("marque"));
                v1.setModele(request.getParameter("modele"));
                v1.setImmatriculation(request.getParameter("immatriculation"));
                v1.setPrixParJour(Double.parseDouble(request.getParameter("prixParJour")));
                v1.setDisponible(request.getParameter("disponible") != null);
                dao.update(v1);
                response.sendRedirect("ServletVoiture");
                break;
            default:
                break;
        }
    }
}