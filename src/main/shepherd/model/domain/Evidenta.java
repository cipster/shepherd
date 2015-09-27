package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Evidenta {
    private long idCod3;
    private String barcode;
    private String nume;
    private String denumireLoc;
    private String denumireLocRecuperare;
    private String dataPreluarii;
    private String dataRecuperarii;
    private String detalii;
    private String detaliiRecuperare;

    @Id
    @Column(name = "id_cod_3")
    public long getIdCod3() {
        return idCod3;
    }

    public void setIdCod3(long idCod3) {
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
