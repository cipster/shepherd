package model.dao;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;

@Entity(name = "raportfinal")
public class RaportFinal {

    private int idRaportFinal;
    private String raportFinal;
    private String nume;
    private String creat_de;
    private Timestamp creat_la;

    @Basic
    @Column(name = "creat_de", nullable = true, insertable = true, updatable = false)
    public String getCreat_de() {
        return creat_de;
    }

    public void setCreat_de(String creat_de) {
        this.creat_de = creat_de;
    }

    @Basic
    @Column(name = "creat_la", nullable = true, updatable = false, insertable = true)
    public Timestamp getCreat_la() {
        return creat_la;
    }

    public void setCreat_la(Timestamp creat_la) {
        this.creat_la = creat_la;
    }

    @Basic
    @Column(name = "nume", nullable = false, insertable = true, updatable = true)
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    @Id
    @Column(name = "id_raport_final", nullable = false, insertable = true, updatable = true)
    public int getIdRaportFinal() {
        return idRaportFinal;
    }

    public void setIdRaportFinal(int idRaportFinal) {
        this.idRaportFinal = idRaportFinal;
    }

    @Basic
    @Column(name = "raport_final", nullable = false, insertable = true, updatable = true)
    public String getRaportFinal() {
        return raportFinal;
    }

    public void setRaportFinal(String raportFinal) {
        this.raportFinal = raportFinal;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RaportFinal that = (RaportFinal) o;

        if (idRaportFinal != that.idRaportFinal) return false;
        if (creat_de != null ? !creat_de.equals(that.creat_de) : that.creat_de != null) return false;
        if (creat_la != null ? !creat_la.equals(that.creat_la) : that.creat_la != null) return false;
        if (nume != null ? !nume.equals(that.nume) : that.nume != null) return false;
        if (raportFinal != null ? !raportFinal.equals(that.raportFinal) : that.raportFinal != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idRaportFinal;
        result = 31 * result + (raportFinal != null ? raportFinal.hashCode() : 0);
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (creat_de != null ? creat_de.hashCode() : 0);
        result = 31 * result + (creat_la != null ? creat_la.hashCode() : 0);
        return result;
    }
}
