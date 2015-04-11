package model.dto;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by Ciprian on 12/14/2014.
 * Project Raindrop
 */
@Entity
public class Persoana {
    private int idPersoana;
    private String nume;
    private String cnp;
    private String functie;
    private String username;
    private String localitate;

    @Id
    @Column(name = "id_persoana")
    public int getIdPersoana() {
        return idPersoana;
    }

    public void setIdPersoana(int idPersoana) {
        this.idPersoana = idPersoana;
    }

    @Basic
    @Column(name = "nume")
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    @Basic
    @Column(name = "cnp")
    public String getCnp() {
        return cnp;
    }

    public void setCnp(String cnp) {
        this.cnp = cnp;
    }

    @Basic
    @Column(name = "functie")
    public String getFunctie() {
        return functie;
    }

    public void setFunctie(String functie) {
        this.functie = functie;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "localitate")
    public String getLocalitate() {
        return localitate;
    }

    public void setLocalitate(String localitate) {
        this.localitate = localitate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Persoana)) return false;

        Persoana persoana = (Persoana) o;

        if (idPersoana != persoana.idPersoana) return false;
        if (nume != null ? !nume.equals(persoana.nume) : persoana.nume != null) return false;
        if (cnp != null ? !cnp.equals(persoana.cnp) : persoana.cnp != null) return false;
        if (functie != null ? !functie.equals(persoana.functie) : persoana.functie != null) return false;
        if (username != null ? !username.equals(persoana.username) : persoana.username != null) return false;
        return !(localitate != null ? !localitate.equals(persoana.localitate) : persoana.localitate != null);

    }

    @Override
    public int hashCode() {
        int result = idPersoana;
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (cnp != null ? cnp.hashCode() : 0);
        result = 31 * result + (functie != null ? functie.hashCode() : 0);
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (localitate != null ? localitate.hashCode() : 0);
        return result;
    }
}
