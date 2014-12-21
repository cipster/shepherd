package projectManager.repository;

import javax.persistence.*;

/**
 * Created by Ciprian on 12/14/2014.
 * Project Raindrop
 */
@Entity
@Table(name = "cod_3", schema = "", catalog = "proiecte")
public class Cod3 {
    private int idCod3;
    private int cod1;
    private int cod2;
    private int cod3;
    private String denumire3;
    private String barcode;
    private String detalii;
    private String pretAchizitie;

    @Id
    @Column(name = "id_cod_3")
    public int getIdCod3() {
        return idCod3;
    }

    public void setIdCod3(int idCod3) {
        this.idCod3 = idCod3;
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
    @Column(name = "cod_3")
    public int getCod3() {
        return cod3;
    }

    public void setCod3(int cod3) {
        this.cod3 = cod3;
    }

    @Basic
    @Column(name = "denumire_3")
    public String getDenumire3() {
        return denumire3;
    }

    public void setDenumire3(String denumire3) {
        this.denumire3 = denumire3;
    }

    @Basic
    @Column(name = "barcode")
    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    @Basic
    @Column(name = "detalii")
    public String getDetalii() {
        return detalii;
    }

    public void setDetalii(String detalii) {
        this.detalii = detalii;
    }

    @Basic
    @Column(name = "pret_achizitie")
    public String getPretAchizitie() {
        return pretAchizitie;
    }

    public void setPretAchizitie(String pretAchizitie) {
        this.pretAchizitie = pretAchizitie;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cod3 cod31 = (Cod3) o;

        if (cod1 != cod31.cod1) return false;
        if (cod2 != cod31.cod2) return false;
        if (cod3 != cod31.cod3) return false;
        if (idCod3 != cod31.idCod3) return false;
        if (barcode != null ? !barcode.equals(cod31.barcode) : cod31.barcode != null) return false;
        if (denumire3 != null ? !denumire3.equals(cod31.denumire3) : cod31.denumire3 != null) return false;
        if (detalii != null ? !detalii.equals(cod31.detalii) : cod31.detalii != null) return false;
        if (pretAchizitie != null ? !pretAchizitie.equals(cod31.pretAchizitie) : cod31.pretAchizitie != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idCod3;
        result = 31 * result + cod1;
        result = 31 * result + cod2;
        result = 31 * result + cod3;
        result = 31 * result + (denumire3 != null ? denumire3.hashCode() : 0);
        result = 31 * result + (barcode != null ? barcode.hashCode() : 0);
        result = 31 * result + (detalii != null ? detalii.hashCode() : 0);
        result = 31 * result + (pretAchizitie != null ? pretAchizitie.hashCode() : 0);
        return result;
    }
}
