package controller;

import dao.ClientDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Client;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/ServletClient", "/ClientEditer", "/ClientSupprimer",
        "/ClientAjouterForm", "/ClientAjouter", "/ClientModifier"})
public class ServletClient extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClientDAO dao;

    public ServletClient() {
        super();
        dao = new ClientDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/ServletClient":
                List<Client> liste = dao.selectAll();
                request.setAttribute("listClients", liste);
                request.getRequestDispatcher("clients.jsp").forward(request, response);
                break;
            case "/ClientEditer":
                int id = Integer.parseInt(request.getParameter("id"));
                Client cl = dao.getById(id);
                if (cl == null) { response.sendRedirect("ServletClient"); return; }
                request.setAttribute("client", cl);
                request.getRequestDispatcher("modifierClient.jsp").forward(request, response);
                break;
            case "/ClientSupprimer":
                int id1 = Integer.parseInt(request.getParameter("id"));
                dao.delete(id1);
                response.sendRedirect("ServletClient");
                break;
            case "/ClientAjouterForm":
                request.getRequestDispatcher("ajouterClient.jsp").forward(request, response);
                break;
            default:
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/ClientAjouter":
                Client cl = new Client();
                cl.setNom(request.getParameter("nom"));
                cl.setPrenom(request.getParameter("prenom"));
                cl.setCin(request.getParameter("cin"));
                cl.setEmail(request.getParameter("email"));
                cl.setTelephone(request.getParameter("telephone"));
                cl.setVille(request.getParameter("ville"));
                dao.add(cl);
                response.sendRedirect("ServletClient");
                break;
            case "/ClientModifier":
                Client cl1 = new Client();
                cl1.setId(Integer.parseInt(request.getParameter("id")));
                cl1.setNom(request.getParameter("nom"));
                cl1.setPrenom(request.getParameter("prenom"));
                cl1.setCin(request.getParameter("cin"));
                cl1.setEmail(request.getParameter("email"));
                cl1.setTelephone(request.getParameter("telephone"));
                cl1.setVille(request.getParameter("ville"));
                dao.update(cl1);
                response.sendRedirect("ServletClient");
                break;
            default:
                break;
        }
    }
}