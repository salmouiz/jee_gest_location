package dao;

import model.Contrat;
import utils.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContratDAO implements CommonDAO<Contrat> {

    private Contrat map(ResultSet rs) throws SQLException {
        Contrat ct = new Contrat();
        ct.setId(rs.getInt("id"));
        ct.setDateDebut(rs.getDate("date_debut"));
        ct.setDateFin(rs.getDate("date_fin"));
        ct.setMontantTotal(rs.getDouble("montant_total"));
        ct.setIdClient(rs.getInt("id_client"));
        ct.setIdVoiture(rs.getInt("id_voiture"));
        return ct;
    }

    @Override
    public List<Contrat> selectAll() {
        List<Contrat> liste = new ArrayList<>();
        String query = "SELECT * FROM contrat";
        try (Connection c = ConnectDB.getConnection();
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(query)) {
            while (rs.next()) liste.add(map(rs));
        } catch (SQLException e) { e.printStackTrace(); }
        return liste;
    }

    @Override
    public void add(Contrat obj) {
        String query = "INSERT INTO contrat (date_debut, date_fin, montant_total, id_client, id_voiture) VALUES (?, ?, ?, ?, ?)";
        try (Connection c = ConnectDB.getConnection();
             PreparedStatement ps = c.prepareStatement(query)) {
            ps.setDate(1, obj.getDateDebut());
            ps.setDate(2, obj.getDateFin());
            ps.setDouble(3, obj.getMontantTotal());
            ps.setInt(4, obj.getIdClient());
            ps.setInt(5, obj.getIdVoiture());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public void delete(int id) {
        String query = "DELETE FROM contrat WHERE id = ?";
        try (Connection c = ConnectDB.getConnection();
             PreparedStatement ps = c.prepareStatement(query)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public void update(Contrat obj) {
        String query = "UPDATE contrat SET date_debut=?, date_fin=?, montant_total=?, id_client=?, id_voiture=? WHERE id=?";
        try (Connection c = ConnectDB.getConnection();
             PreparedStatement ps = c.prepareStatement(query)) {
            ps.setDate(1, obj.getDateDebut());
            ps.setDate(2, obj.getDateFin());
            ps.setDouble(3, obj.getMontantTotal());
            ps.setInt(4, obj.getIdClient());
            ps.setInt(5, obj.getIdVoiture());
            ps.setInt(6, obj.getId());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public Contrat getById(int id) {
        String query = "SELECT * FROM contrat WHERE id = ?";
        Contrat ct = null;
        try (Connection c = ConnectDB.getConnection();
             PreparedStatement ps = c.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) ct = map(rs);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return ct;
    }

    @Override
    public int getIDMax() {
        String query = "SELECT MAX(id) AS max_id FROM contrat";
        int max = 0;
        try (Connection c = ConnectDB.getConnection();
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(query)) {
            if (rs.next()) max = rs.getInt("max_id") + 1;
        } catch (SQLException e) { e.printStackTrace(); }
        return max;
    }
}