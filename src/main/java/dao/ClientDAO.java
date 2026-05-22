package dao;

import model.Client;
import utils.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClientDAO implements CommonDAO<Client> {

    private Client map(ResultSet rs) throws SQLException {
        Client cl = new Client();
        cl.setId(rs.getInt("id"));
        cl.setNom(rs.getString("nom"));
        cl.setPrenom(rs.getString("prenom"));
        cl.setCin(rs.getString("cin"));
        cl.setEmail(rs.getString("email"));
        cl.setTelephone(rs.getString("telephone"));
        cl.setVille(rs.getString("ville"));
        return cl;
    }

    @Override
    public List<Client> selectAll() {
        List<Client> liste = new ArrayList<>();
        String query = "SELECT * FROM client";
        try (Connection c = ConnectDB.getConnection();
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(query)) {
            while (rs.next()) liste.add(map(rs));
        } catch (SQLException e) { e.printStackTrace(); }
        return liste;
    }

    @Override
    public void add(Client obj) {
        String query = "INSERT INTO client (nom, prenom, cin, email, telephone, ville) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection c = ConnectDB.getConnection();
             PreparedStatement ps = c.prepareStatement(query)) {
            ps.setString(1, obj.getNom());
            ps.setString(2, obj.getPrenom());
            ps.setString(3, obj.getCin());
            ps.setString(4, obj.getEmail());
            ps.setString(5, obj.getTelephone());
            ps.setString(6, obj.getVille());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public void delete(int id) {
        String query = "DELETE FROM client WHERE id = ?";
        try (Connection c = ConnectDB.getConnection();
             PreparedStatement ps = c.prepareStatement(query)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public void update(Client obj) {
        String query = "UPDATE client SET nom=?, prenom=?, cin=?, email=?, telephone=?, ville=? WHERE id=?";
        try (Connection c = ConnectDB.getConnection();
             PreparedStatement ps = c.prepareStatement(query)) {
            ps.setString(1, obj.getNom());
            ps.setString(2, obj.getPrenom());
            ps.setString(3, obj.getCin());
            ps.setString(4, obj.getEmail());
            ps.setString(5, obj.getTelephone());
            ps.setString(6, obj.getVille());
            ps.setInt(7, obj.getId());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public Client getById(int id) {
        String query = "SELECT * FROM client WHERE id = ?";
        Client cl = null;
        try (Connection c = ConnectDB.getConnection();
             PreparedStatement ps = c.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) cl = map(rs);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return cl;
    }

    @Override
    public int getIDMax() {
        String query = "SELECT MAX(id) AS max_id FROM client";
        int max = 0;
        try (Connection c = ConnectDB.getConnection();
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(query)) {
            if (rs.next()) max = rs.getInt("max_id") + 1;
        } catch (SQLException e) { e.printStackTrace(); }
        return max;
    }
}