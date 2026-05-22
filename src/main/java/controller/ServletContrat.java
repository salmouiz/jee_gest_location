package controller;

import dao.ClientDAO;
import dao.ContratDAO;
import dao.VoitureDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Contrat;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(urlPatterns = {"/ServletContrat", "/ContratEditer", "/ContratSupprimer",
        "/ContratAjouterForm", "/ContratAjouter", "/ContratModifier"})
public class ServletContrat extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContratDAO dao;
    private ClientDAO clientDAO;
    private VoitureDAO voitureDAO;

    public ServletContrat() {
        super();
        dao = new ContratDAO();
        clientDAO = new ClientDAO();
        voitureDAO = new VoitureDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/ServletContrat":
                List<Contrat> liste = dao.selectAll();
                request.setAttribute("listContrats", liste);
                request.setAttribute("listClients", clientDAO.selectAll());
                request.setAttribute("listVoitures", voitureDAO.selectAll());
                request.getRequestDispatcher("contrats.jsp").forward(request, response);
                break;
            case "/ContratEditer":
                int id = Integer.parseInt(request.getParameter("id"));
                Contrat ct = dao.getById(id);
                if (ct == null) { response.sendRedirect("ServletContrat"); return; }
                request.setAttribute("contrat", ct);
                request.setAttribute("listClients", clientDAO.selectAll());
                request.setAttribute("listVoitures", voitureDAO.selectDisponibles());
                request.getRequestDispatcher("modifierContrat.jsp").forward(request, response);
                break;
            case "/ContratSupprimer":
                int id1 = Integer.parseInt(request.getParameter("id"));
                dao.delete(id1);
                response.sendRedirect("ServletContrat");
                break;
            case "/ContratAjouterForm":
                request.setAttribute("listClients", clientDAO.selectAll());
                request.setAttribute("listVoitures", voitureDAO.selectDisponibles());
                request.getRequestDispatcher("ajouterContrat.jsp").forward(request, response);
                break;
            default:
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/ContratAjouter":
                Contrat ct = new Contrat();
                ct.setDateDebut(Date.valueOf(request.getParameter("dateDebut")));
                ct.setDateFin(Date.valueOf(request.getParameter("dateFin")));
                ct.setMontantTotal(Double.parseDouble(request.getParameter("montantTotal")));
                ct.setIdClient(Integer.parseInt(request.getParameter("idClient")));
                ct.setIdVoiture(Integer.parseInt(request.getParameter("idVoiture")));
                dao.add(ct);
                response.sendRedirect("ServletContrat");
                break;
            case "/ContratModifier":
                Contrat ct1 = new Contrat();
                ct1.setId(Integer.parseInt(request.getParameter("id")));
                ct1.setDateDebut(Date.valueOf(request.getParameter("dateDebut")));
                ct1.setDateFin(Date.valueOf(request.getParameter("dateFin")));
                ct1.setMontantTotal(Double.parseDouble(request.getParameter("montantTotal")));
                ct1.setIdClient(Integer.parseInt(request.getParameter("idClient")));
                ct1.setIdVoiture(Integer.parseInt(request.getParameter("idVoiture")));
                dao.update(ct1);
                response.sendRedirect("ServletContrat");
                break;
            default:
                break;
        }
    }
}