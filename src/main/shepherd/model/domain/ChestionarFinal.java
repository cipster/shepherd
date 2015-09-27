package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;


@Entity(name = "chestionarfinal")
public class ChestionarFinal {

    private long idChestionarFinal;
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
    public long getIdChestionarFinal() {
        return idChestionarFinal;
    }

    public void setIdChestionarFinal(long idChestionarFinal) {
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
}
