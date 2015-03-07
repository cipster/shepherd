package model.dao;

import javax.persistence.*;

/**
 * Created by Ciprian on 12/14/2014.
 * Project Raindrop
 */
@Entity
@Table(name = "cod_2", schema = "", catalog = "proiecte")
public class Cod2 {
    private int idCod2;
    private int cod1;
    private int cod2;
    private String denumire2;

    @Id
    @Column(name = "id_cod_2")
    public int getIdCod2() {
        return idCod2;
    }

    public void setIdCod2(int idCod2) {
        this.idCod2 = idCod2;
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
    @Column(name = "cod_2")
    public int getCod2() {
        return cod2;
    }

    public void setCod2(int cod2) {
        this.cod2 = cod2;
    }

    @Basic
    @Column(name = "denumire_2")
    public String getDenumire2() {
        return denumire2;
    }

    public void setDenumire2(String denumire2) {
        this.denumire2 = denumire2;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cod2 cod21 = (Cod2) o;

        if (cod1 != cod21.cod1) return false;
        if (cod2 != cod21.cod2) return false;
        if (idCod2 != cod21.idCod2) return false;
        if (denumire2 != null ? !denumire2.equals(cod21.denumire2) : cod21.denumire2 != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idCod2;
        result = 31 * result + cod1;
        result = 31 * result + cod2;
        result = 31 * result + (denumire2 != null ? denumire2.hashCode() : 0);
        return result;
    }
}
