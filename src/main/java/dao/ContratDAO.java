package dao;

import model.Contrat;
import utils.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContratDAO implements CommonDAO<Contrat> {

    @Override
    public List<Contrat> selectAll() {
        List<Contrat> liste = new ArrayList<>();
        Connection c = ConnectDB.getConnection();
        String query = "SELECT * FROM contrat";
        try {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(query);
            while (rs.next()){
                Contrat ct = new Contrat();
				ct.setId(rs.getInt("id"));
				ct.setDateDebut(rs.getDate("date_debut"));
				ct.setDateFin(rs.getDate("date_fin"));
				ct.setMontantTotal(rs.getDouble("montant_total"));
				ct.setIdClient(rs.getInt("id_client"));
				ct.setIdVoiture(rs.getInt("id_voiture"));
                liste.add(ct);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return liste;
    }

    @Override
    public void add(Contrat obj) {
        Connection c = ConnectDB.getConnection();
        String query = "INSERT INTO contrat (id, date_debut, date_fin, montant_total, id_client, id_voiture) VALUES (?, ?, ?, ?, ?, ?)";
        try{
            PreparedStatement ps = c.prepareStatement(query);
            ps.setId(1, obj.getId());
            ps.setDate(2, obj.getDateDebut());
            ps.setDate(3, obj.getDateFin());
            ps.setDouble(4, obj.getMontantTotal());
            ps.setInt(5, obj.getIdClient());
            ps.setInt(6, obj.getIdVoiture());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public void delete(int id) {
        Connection c = ConnectDB.getConnection();
        String query = "DELETE FROM contrat WHERE id = ?";
        try {
            PreparedStatement ps = c.prepareStatement(query);
            ps.setInt(1, id);
            int n = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public void update(Contrat obj) {
        Connection c = ConnectDB.getConnection();
        String query = "UPDATE contrat SET date_debut=?, date_fin=?, montant_total=?, id_client=?, id_voiture=? WHERE id=?";
        try {
            PreparedStatement ps = c.prepareStatement(query);
            ps.setInt(1, obj.getId());
            ps.setDate(2, obj.getDateDebut());
            ps.setDate(3, obj.getDateFin());
            ps.setDouble(4, obj.getMontantTotal());
            ps.setInt(5, obj.getIdClient());
            ps.setInt(6, obj.getIdVoiture());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public Contrat getById(int id) {
        Connection c = ConnectDB.getConnection();
        String query = "SELECT * FROM contrat WHERE id = ?";
        Contrat ct = null;
        try {
            PreparedStatement ps = c.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery()
            if (rs.next()){
                ct = new Contrat();
				ct.setId(rs.getInt("id"));
				ct.setDateDebut(rs.getDate("date_debut"));
				ct.setDateFin(rs.getDate("date_fin"));
				ct.setMontantTotal(rs.getDouble("montant_total"));
				ct.setIdClient(rs.getInt("id_client"));
				ct.setIdVoiture(rs.getInt("id_voiture"));
            }
            ps.close();
            
        } catch (SQLException e) { e.printStackTrace(); }
        return ct;
    }

    @Override
    public int getIDMax() {
        Connection c = ConnectDB.getConnection();
        String query = "SELECT MAX(id) AS max_id FROM contrat";
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
