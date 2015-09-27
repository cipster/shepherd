package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;


@Entity(name = "propunere")
public class Propunere {

    private long idPropunere;
    private String propunere;
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
    @Column(name = "id_propunere", nullable = false, insertable = true, updatable = true)
    public long getIdPropunere() {
        return idPropunere;
    }

    public void setIdPropunere(long idPropunere) {
        this.idPropunere = idPropunere;
    }

    @Basic
    @Column(name = "propunere", nullable = false, insertable = true, updatable = true)
    public String getPropunere() {
        return propunere;
    }

    public void setPropunere(String propunere) {
        this.propunere = propunere;
    }

}
