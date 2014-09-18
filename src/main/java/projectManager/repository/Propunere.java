package projectManager.repository;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;
import java.util.Arrays;


@Entity(name = "propunere")
public class Propunere {

    private int idPropunere;
    private byte[] propunere;
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
    public int getIdPropunere() {
        return idPropunere;
    }

    public void setIdPropunere(int idPropunere) {
        this.idPropunere = idPropunere;
    }

    @Basic
    @Column(name = "propunere", nullable = false, insertable = true, updatable = true)
    public byte[] getPropunere() {
        return propunere;
    }

    public void setPropunere(byte[] propunere) {
        this.propunere = propunere;
    }

    @Override
    public int hashCode() {
        int result = idPropunere;
        result = 31 * result + (propunere != null ? Arrays.hashCode(propunere) : 0);
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || getClass() != o.getClass()) return false;

        Propunere propunere1 = (Propunere) o;

        if(idPropunere != propunere1.idPropunere) return false;
        if(!Arrays.equals(propunere, propunere1.propunere)) return false;

        return true;
    }
}
