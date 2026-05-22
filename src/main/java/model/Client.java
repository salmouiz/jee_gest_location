package model;

public class Client {
    private int id;
    private String nom;
    private String prenom;
    private String cin;
    private String email;
    private String telephone;
    private String ville;

    public Client() {}

    public Client(int id, String nom, String prenom, String cin,
                  String email, String telephone, String ville) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.cin = cin;
        this.email = email;
        this.telephone = telephone;
        this.ville = ville;
    }

    @Override
    public String toString() {
        return "Client [id=" + id + ", nom=" + nom + ", prenom=" + prenom +
               ", cin=" + cin + ", email=" + email +
               ", telephone=" + telephone + ", ville=" + ville + "]";
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }
    public String getCin() { return cin; }
    public void setCin(String cin) { this.cin = cin; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getTelephone() { return telephone; }
    public void setTelephone(String telephone) { this.telephone = telephone; }
    public String getVille() { return ville; }
    public void setVille(String ville) { this.ville = ville; }
}