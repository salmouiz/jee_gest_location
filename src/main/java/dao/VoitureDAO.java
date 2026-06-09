package dao;

import model.Voiture;
import utils.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VoitureDAO implements CommonDAO<Voiture> {

    @Override
    public List<Voiture> selectAll() {
        List<Voiture> liste = new ArrayList<>();
        String query = "SELECT * FROM voiture";
        Connection c = ConnectDB.getConnection();
        try {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(query);
            while (rs.next()){
                Voiture v = new Voiture();
                v.setId(rs.getInt("id"));
                v.setMarque(rs.getString("marque"));
                v.setModele(rs.getString("modele"));
                v.setImmatriculation(rs.getString("immatriculation"));
                v.setPrixParJour(rs.getDouble("prix_par_jour"));
                v.setDisponible(rs.getBoolean("disponible"));
                liste.add(v);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return liste;
    }

    @Override
    public void add(Voiture obj) {
        Connection c = ConnectDB.getConnection();
        String query = "INSERT INTO voiture (id,marque, modele, immatriculation, prix_par_jour, disponible) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = c.prepareStatement(query);
            ps.setInt(1, obj.getId());
            ps.setString(2, obj.getMarque());
            ps.setString(3, obj.getModele());
            ps.setString(4, obj.getImmatriculation());
            ps.setDouble(5, obj.getPrixParJour());
            ps.setBoolean(6, obj.isDisponible());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public void delete(int id) {
        Connection c = ConnectDB.getConnection();
        String query = "DELETE FROM voiture WHERE id = ?";
        try {
            PreparedStatement ps = c.prepareStatement(query);
            ps.setInt(1, id);
            int n = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public void update(Voiture obj) {
        Connection c = ConnectDB.getConnection();
        String query = "UPDATE voiture SET marque=?, modele=?, immatriculation=?, prix_par_jour=?, disponible=? WHERE id=?";
        try {
            PreparedStatement ps = c.prepareStatement(query);
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
        Connection c = ConnectDB.getConnection();
        String query = "SELECT * FROM voiture WHERE id = ?";
        Voiture v = null;
        try {
            PreparedStatement ps = c.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                v = new Voiture();
                v.setId(rs.getInt("id"));
                v.setMarque(rs.getString("marque"));
                v.setModele(rs.getString("modele"));
                v.setImmatriculation(rs.getString("immatriculation"));
                v.setPrixParJour(rs.getDouble("prix_par_jour"));
                v.setDisponible(rs.getBoolean("disponible"));
            }
            ps.close();
            
        } catch (SQLException e) { e.printStackTrace(); }
        return v;
    }

    @Override
    public int getIDMax() {
        Connection c = ConnectDB.getConnection();
        String query = "SELECT MAX(id) AS max_id FROM voiture";
        int max = 0;
        try {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(query);
            if (rs.next())
                max = rs.getInt("max_id") + 1;
        } catch (SQLException e) { e.printStackTrace(); }
        return max;
    }

    public List<Voiture> selectDisponibles() {
        List<Voiture> liste = new ArrayList<>();
        Connection c = ConnectDB.getConnection();
        String query = "SELECT * FROM voiture WHERE disponible = true";
        try {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                Voiture v = new Voiture();
                v.setId(rs.getInt("id"));
                v.setMarque(rs.getString("marque"));
                v.setModele(rs.getString("modele"));
                v.setImmatriculation(rs.getString("immatriculation"));
                v.setPrixParJour(rs.getDouble("prix_par_jour"));
                v.setDisponible(rs.getBoolean("disponible"));
                liste.add(v);
            }
                
        } catch (SQLException e) { e.printStackTrace(); }
        return liste;
    }
}
