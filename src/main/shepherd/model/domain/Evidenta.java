package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Evidenta {
    private int idCod3;
    private String barcode;
    private String nume;
    private String denumireLoc;
    private String denumireLocRecuperare;
    private String dataPreluarii;
    private String dataRecuperarii;
    private String detalii;
    private String detaliiRecuperare;

    @Basic
    @Column(name = "id_cod_3")
    public int getIdCod3() {
        return idCod3;
    }

    public void setIdCod3(int idCod3) {
        this.idCod3 = idCod3;
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
    @Column(name = "nume")
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    @Basic
    @Column(name = "denumire_loc")
    public String getDenumireLoc() {
        return denumireLoc;
    }

    public void setDenumireLoc(String denumireLoc) {
        this.denumireLoc = denumireLoc;
    }

    @Basic
    @Column(name = "data_preluarii")
    public String getDataPreluarii() {
        return dataPreluarii;
    }

    public void setDataPreluarii(String dataPreluarii) {
        this.dataPreluarii = dataPreluarii;
    }

    @Basic
    @Column(name = "data_recuperarii")
    public String getDataRecuperarii() {
        return dataRecuperarii;
    }

    public void setDataRecuperarii(String dataRecuperarii) {
        this.dataRecuperarii = dataRecuperarii;
    }

    @Basic
    @Column(name = "detalii")
    public String getDetalii() {
        return detalii;
    }

    public void setDetalii(String detalii) {
        this.detalii = detalii;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Evidenta evidenta = (Evidenta) o;

        if (idCod3 != evidenta.idCod3) return false;
        if (barcode != null ? !barcode.equals(evidenta.barcode) : evidenta.barcode != null) return false;
        if (nume != null ? !nume.equals(evidenta.nume) : evidenta.nume != null) return false;
        if (denumireLoc != null ? !denumireLoc.equals(evidenta.denumireLoc) : evidenta.denumireLoc != null) return false;
        if (dataPreluarii != null ? !dataPreluarii.equals(evidenta.dataPreluarii) : evidenta.dataPreluarii != null) return false;
        if (dataRecuperarii != null ? !dataRecuperarii.equals(evidenta.dataRecuperarii) : evidenta.dataRecuperarii != null) return false;
        if (detalii != null ? !detalii.equals(evidenta.detalii) : evidenta.detalii != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idCod3;
        result = 31 * result + (barcode != null ? barcode.hashCode() : 0);
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + (denumireLoc != null ? denumireLoc.hashCode() : 0);
        result = 31 * result + (dataPreluarii != null ? dataPreluarii.hashCode() : 0);
        result = 31 * result + (dataRecuperarii != null ? dataRecuperarii.hashCode() : 0);
        result = 31 * result + (detalii != null ? detalii.hashCode() : 0);
        return result;
    }

    @Basic
    @Column(name = "detalii_recuperare")
    public String getDetaliiRecuperare() {
        return detaliiRecuperare;
    }

    public void setDetaliiRecuperare(String detaliiRecuperare) {
        this.detaliiRecuperare = detaliiRecuperare;
    }

    @Basic
    @Column(name = "denumire_loc_recuperare")
    public String getDenumireLocRecuperare() {
        return denumireLocRecuperare;
    }

    public void setDenumireLocRecuperare(String denumireLocRecuperare) {
        this.denumireLocRecuperare = denumireLocRecuperare;
    }
}
