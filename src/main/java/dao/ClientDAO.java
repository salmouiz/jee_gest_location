package dao;

import model.Client;
import utils.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClientDAO implements CommonDAO<Client> {

    @Override
    public List<Client> selectAll() {
        List<Client> liste = new ArrayList<>();
        String query = "SELECT * FROM client";
        Connection c = ConnectDB.getConnection();
        try {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(query);
            while (rs.next()){
                Client cl = new Client();
                cl.setId(rs.getInt("id"));
                cl.setNom(rs.getString("nom"));
                cl.setPrenom(rs.getString("prenom"));
                cl.setCin(rs.getString("cin"));
                cl.setEmail(rs.getString("email"));
                cl.setTelephone(rs.getString("telephone"));
                cl.setVille(rs.getString("ville"));
                liste.add(cl);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return liste;
    }

    @Override
    public void add(Client obj) {
        Connection c = ConnectDB.getConnection();
        String query = "INSERT INTO client (id, nom, prenom, cin, email, telephone, ville) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = c.prepareStatement(query);
            ps.setId(1, obj.getId());
            ps.setString(2, obj.getNom());
            ps.setString(3, obj.getPrenom());
            ps.setString(4, obj.getCin());
            ps.setString(5, obj.getEmail());
            ps.setString(6, obj.getTelephone());
            ps.setString(7, obj.getVille());
            ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        Connection c = ConnectDB.getConnection();
        String query = "DELETE FROM client WHERE id = ?";
        try {
            PreparedStatement ps = c.prepareStatement(query);
            ps.setInt(1, id);
            int n = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Client obj) {
        Connection c = ConnectDB.getConnection();
        String query = "UPDATE client SET nom=?, prenom=?, cin=?, email=?, telephone=?, ville=? WHERE id=?";
        try {
            PreparedStatement ps = c.prepareStatement(query));
            ps.setInt(1, obj.getId());
            ps.setString(2, obj.getNom());
            ps.setString(3, obj.getPrenom());
            ps.setString(4, obj.getCin());
            ps.setString(5, obj.getEmail());
            ps.setString(6, obj.getTelephone());
            ps.setString(7, obj.getVille());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public Client getById(int id) {
        Connection c = ConnectDB.getConnection();
        String query = "SELECT * FROM client WHERE id = ?";
        Client cl = null;
        try {
            PreparedStatement ps = c.prepareStatement(query));
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery()
                if (rs.next()){
                    cl = new Client();
                    cl.setId(rs.getInt("id"));
                    cl.setNom(rs.getString("nom"));
                    cl.setPrenom(rs.getString("prenom"));
                    cl.setCin(rs.getString("cin"));
                    cl.setEmail(rs.getString("email"));
                    cl.setTelephone(rs.getString("telephone"));
                    cl.setVille(rs.getString("ville"));
                }
                ps.close();
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return cl;
    }

    @Override
    public int getIDMax() {
        Connection c = ConnectDB.getConnection();
        String query = "SELECT MAX(id) AS max_id FROM client";
        int max = 0;
        try {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(query);
            if (rs.next())
                max = rs.getInt("max_id") + 1;
        } catch (SQLException e) { e.printStackTrace(); }
        return max;
    }
}
