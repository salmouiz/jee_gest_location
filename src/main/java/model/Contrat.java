package model;
import java.sql.Date;

public class Contrat {
    private int id;
    private Date dateDebut;
    private Date dateFin;
    private double montantTotal;
    private int idClient;
    private int idVoiture;

    public Contrat() {}

    public Contrat(int id, Date dateDebut, Date dateFin,
                   double montantTotal, int idClient, int idVoiture) {
        this.id = id;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.montantTotal = montantTotal;
        this.idClient = idClient;
        this.idVoiture = idVoiture;
    }

    @Override
    public String toString() {
        return "Contrat [id=" + id + ", dateDebut=" + dateDebut + ", dateFin=" + dateFin +
               ", montantTotal=" + montantTotal + ", idClient=" + idClient +
               ", idVoiture=" + idVoiture + "]";
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public Date getDateDebut() { return dateDebut; }
    public void setDateDebut(Date dateDebut) { this.dateDebut = dateDebut; }
    public Date getDateFin() { return dateFin; }
    public void setDateFin(Date dateFin) { this.dateFin = dateFin; }
    public double getMontantTotal() { return montantTotal; }
    public void setMontantTotal(double montantTotal) { this.montantTotal = montantTotal; }
    public int getIdClient() { return idClient; }
    public void setIdClient(int idClient) { this.idClient = idClient; }
    public int getIdVoiture() { return idVoiture; }
    public void setIdVoiture(int idVoiture) { this.idVoiture = idVoiture; }
}