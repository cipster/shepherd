package model.dto;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;


@Entity(name = "bd")
public class Bd {

    private int idBd;
    private String bd;
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
    @Column(name = "id_bd", nullable = false, insertable = true, updatable = true)
    public int getIdBd() {
        return idBd;
    }

    public void setIdBd(int idBd) {
        this.idBd = idBd;
    }

    @Basic
    @Column(name = "bd", nullable = false, insertable = true, updatable = true)
    public String getBd() {
        return bd;
    }

    public void setBd(String bd) {
        this.bd = bd;
    }

    @Override
    public int hashCode() {
        int result = idBd;
        result = 31 * result + (bd != null ? bd.hashCode() : 0);
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (creat_de != null ? creat_de.hashCode() : 0);
        result = 31 * result + (creat_la != null ? creat_la.hashCode() : 0);
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || getClass() != o.getClass()) return false;

        Bd bd1 = (Bd) o;

        if(idBd != bd1.idBd) return false;
        if(!bd.equals( bd1.bd)) return false;

        return true;
    }
}
