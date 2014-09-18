package projectManager.repository;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;
import java.util.Arrays;


@Entity(name = "altemateriale")
public class AlteMateriale {

    private int idAlteMateriale;
    private byte[] altemateriale;
    private String nume;
    private String creat_de;
    private Timestamp creat_la;

    @Basic
    @Column(name = "nume", nullable = false, insertable = true, updatable = true)
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    @Id
    @Column(name = "id_alte_materiale", nullable = false, insertable = true, updatable = true)
    public int getIdAlteMateriale() {
        return idAlteMateriale;
    }

    public void setIdAlteMateriale(int idAlteMateriale) {
        this.idAlteMateriale = idAlteMateriale;
    }

    @Basic
    @Column(name = "altemateriale", nullable = false, insertable = true, updatable = true)
    public byte[] getAltemateriale() {
        return altemateriale;
    }

    public void setAltemateriale(byte[] altemateriale) {
        this.altemateriale = altemateriale;
    }

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

    @Override
    public int hashCode() {
        int result = idAlteMateriale;
        result = 31 * result + (altemateriale != null ? Arrays.hashCode(altemateriale) : 0);
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || getClass() != o.getClass()) return false;

        AlteMateriale that = (AlteMateriale) o;

        if(idAlteMateriale != that.idAlteMateriale) return false;
        if(!Arrays.equals(altemateriale, that.altemateriale)) return false;

        return true;
    }
}
