package model.domain;

import javax.persistence.*;

/**
 * Created by Ciprian on 12/14/2014.
 * Project Raindrop
 */
@Entity
@Table(name = "cod_1", schema = "", catalog = "proiecte")
public class Cod1 {
    private int idCod1;
    private int cod1;
    private String denumire1;

    @Id
    @Column(name = "id_cod_1")
    public int getIdCod1() {
        return idCod1;
    }

    public void setIdCod1(int idCod1) {
        this.idCod1 = idCod1;
    }

    @Basic
    @Column(name = "cod_1")
    public int getCod1() {
        return cod1;
    }

    public void setCod1(int cod1) {
        this.cod1 = cod1;
    }

    @Basic
    @Column(name = "denumire_1")
    public String getDenumire1() {
        return denumire1;
    }

    public void setDenumire1(String denumire1) {
        this.denumire1 = denumire1;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cod1 cod11 = (Cod1) o;

        if (cod1 != cod11.cod1) return false;
        if (idCod1 != cod11.idCod1) return false;
        if (denumire1 != null ? !denumire1.equals(cod11.denumire1) : cod11.denumire1 != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idCod1;
        result = 31 * result + cod1;
        result = 31 * result + (denumire1 != null ? denumire1.hashCode() : 0);
        return result;
    }
}
