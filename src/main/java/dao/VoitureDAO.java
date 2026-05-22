package dao;

import model.Voiture;
import utils.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VoitureDAO implements CommonDAO<Voiture> {

    private Voiture map(ResultSet rs) throws SQLException {
        Voiture v = new Voiture();
        v.setId(rs.getInt("id"));
        v.setMarque(rs.getString("marque"));
        v.setModele(rs.getString("modele"));
        v.setImmatriculation(rs.getString("immatriculation"));
        v.setPrixParJour(rs.getDouble("prix_par_jour"));
        v.setDisponible(rs.getBoolean("disponible"));
        return v;
    }

    @Override
    public List<Voiture> selectAll() {
        List<Voiture> liste = new ArrayList<>();
        String query = "SELECT * FROM voiture";
        try (Connection c = ConnectDB.getConnection();
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(query)) {
            while (rs.next()) liste.add(map(rs));
        } catch (SQLException e) { e.printStackTrace(); }
        return liste;
    }

    @Override
    public void add(Voiture obj) {
        String query = "INSERT INTO voiture (marque, modele, immatriculation, prix_par_jour, disponible) VALUES (?, ?, ?, ?, ?)";
        try (Connection c = ConnectDB.getConnection();
             PreparedStatement ps = c.prepareStatement(query)) {
            ps.setString(1, obj.getMarque());
            ps.setString(2, obj.getModele());
            ps.setString(3, obj.getImmatriculation());
            ps.setDouble(4, obj.getPrixParJour());
            ps.setBoolean(5, obj.isDisponible());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public void delete(int id) {
        String query = "DELETE FROM voiture WHERE id = ?";
        try (Connection c = ConnectDB.getConnection();
             PreparedStatement ps = c.prepareStatement(query)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public void update(Voiture obj) {
        String query = "UPDATE voiture SET marque=?, modele=?, immatriculation=?, prix_par_jour=?, disponible=? WHERE id=?";
        try (Connection c = ConnectDB.getConnection();
             PreparedStatement ps = c.prepareStatement(query)) {
            ps.setString(1, obj.getMarque());
            ps.setString(2, obj.getModele());
            ps.setString(3, obj.getImmatriculation());
            ps.setDouble(4, obj.getPrixParJour());
            ps.setBoolean(5, obj.isDisponible());
            ps.setInt(6, obj.getId());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public Voiture getById(int id) {
        String query = "SELECT * FROM voiture WHERE id = ?";
        Voiture v = null;
        try (Connection c = ConnectDB.getConnection();
             PreparedStatement ps = c.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) v = map(rs);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return v;
    }

    @Override
    public int getIDMax() {
        String query = "SELECT MAX(id) AS max_id FROM voiture";
        int max = 0;
        try (Connection c = ConnectDB.getConnection();
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(query)) {
            if (rs.next()) max = rs.getInt("max_id") + 1;
        } catch (SQLException e) { e.printStackTrace(); }
        return max;
    }

    public List<Voiture> selectDisponibles() {
        List<Voiture> liste = new ArrayList<>();
        String query = "SELECT * FROM voiture WHERE disponible = true";
        try (Connection c = ConnectDB.getConnection();
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(query)) {
            while (rs.next()) liste.add(map(rs));
        } catch (SQLException e) { e.printStackTrace(); }
        return liste;
    }
}