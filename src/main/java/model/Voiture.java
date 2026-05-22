package model;

public class Voiture {
    private int id;
    private String marque;
    private String modele;
    private String immatriculation;
    private double prixParJour;
    private boolean disponible;

    public Voiture() {}

    public Voiture(int id, String marque, String modele, String immatriculation,
                   double prixParJour, boolean disponible) {
        this.id = id;
        this.marque = marque;
        this.modele = modele;
        this.immatriculation = immatriculation;
        this.prixParJour = prixParJour;
        this.disponible = disponible;
    }

    @Override
    public String toString() {
        return "Voiture [id=" + id + ", marque=" + marque + ", modele=" + modele +
               ", immatriculation=" + immatriculation + ", prixParJour=" + prixParJour +
               ", disponible=" + disponible + "]";
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getMarque() { return marque; }
    public void setMarque(String marque) { this.marque = marque; }
    public String getModele() { return modele; }
    public void setModele(String modele) { this.modele = modele; }
    public String getImmatriculation() { return immatriculation; }
    public void setImmatriculation(String immatriculation) { this.immatriculation = immatriculation; }
    public double getPrixParJour() { return prixParJour; }
    public void setPrixParJour(double prixParJour) { this.prixParJour = prixParJour; }
    public boolean isDisponible() { return disponible; }
    public void setDisponible(boolean disponible) { this.disponible = disponible; }
}