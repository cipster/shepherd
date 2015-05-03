package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by Ciprian on 12/14/2014.
 * Project Raindrop
 */
@Entity
public class Loc {
    private int idLoc;
    private String denumireLoc;

    @Id
    @Column(name = "id_loc")
    public int getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(int idLoc) {
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Loc loc = (Loc) o;

        if (idLoc != loc.idLoc) return false;
        if (denumireLoc != null ? !denumireLoc.equals(loc.denumireLoc) : loc.denumireLoc != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idLoc;
        result = 31 * result + (denumireLoc != null ? denumireLoc.hashCode() : 0);
        return result;
    }
}
