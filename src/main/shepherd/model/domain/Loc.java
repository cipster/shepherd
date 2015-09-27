package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Loc {
    private long idLoc;
    private String denumireLoc;

    @Id
    @Column(name = "id_loc")
    public long getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(long idLoc) {
        this.idLoc = idLoc;
    }

    @Basic
    @Column(name = "denumire_loc")
    public String getDenumireLoc() {
        return denumireLoc;
    }

    public void setDenumireLoc(String denumireLoc) {
        this.denumireLoc = denumireLoc;
    }
}
