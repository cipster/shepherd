package projectManager.repository;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;
import java.util.Arrays;


@Entity(name = "chestionarfinal")
public class ChestionarFinal {

    private int idChestionarFinal;
    private String chestionarFinal;
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
    @Column(name = "id_chestionar_final", nullable = false, insertable = true, updatable = true)
    public int getIdChestionarFinal() {
        return idChestionarFinal;
    }

    public void setIdChestionarFinal(int idChestionarFinal) {
        this.idChestionarFinal = idChestionarFinal;
    }

    @Basic
    @Column(name = "chestionar_final", nullable = false, insertable = true, updatable = true)
    public String getChestionarFinal() {
        return chestionarFinal;
    }

    public void setChestionarFinal(String chestionarFinal) {
        this.chestionarFinal = chestionarFinal;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ChestionarFinal that = (ChestionarFinal) o;

        if (idChestionarFinal != that.idChestionarFinal) return false;
        if (chestionarFinal != null ? !chestionarFinal.equals(that.chestionarFinal) : that.chestionarFinal != null)
            return false;
        if (creat_de != null ? !creat_de.equals(that.creat_de) : that.creat_de != null) return false;
        if (creat_la != null ? !creat_la.equals(that.creat_la) : that.creat_la != null) return false;
        if (nume != null ? !nume.equals(that.nume) : that.nume != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idChestionarFinal;
        result = 31 * result + (chestionarFinal != null ? chestionarFinal.hashCode() : 0);
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (creat_de != null ? creat_de.hashCode() : 0);
        result = 31 * result + (creat_la != null ? creat_la.hashCode() : 0);
        return result;
    }
}
