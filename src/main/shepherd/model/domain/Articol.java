package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Articol {
    private long idCod3;
    private String denumire1;
    private String denumire2;
    private String denumire3;
    private String barcode;
    private String detalii;
    private String pretAchizitie;
    private Integer stare;
    private Integer idLoc;
    private Integer idPersoana;
    private String dataAdaugare;
    private String dataRecuperare;
    private String dataPrimire;
    private String detaliiRecuperare;
    private String modificatDe;

    @Id
    @Column(name = "id_cod_3")
    public long getIdCod3() {
        return idCod3;
    }

    public void setIdCod3(long idCod3) {
        this.idCod3 = idCod3;
    }

    @Basic
    @Column(name = "denumire_1")
    public String getDenumire1() {
        return denumire1;
    }

    public void setDenumire1(String denumire1) {
        this.denumire1 = denumire1;
    }

    @Basic
    @Column(name = "denumire_2")
    public String getDenumire2() {
        return denumire2;
    }

    public void setDenumire2(String denumire2) {
        this.denumire2 = denumire2;
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

    @Basic
    @Column(name = "stare")
    public Integer getStare() {
        return stare;
    }

    public void setStare(Integer stare) {
        this.stare = stare;
    }

    @Basic
    @Column(name = "id_loc")
    public Integer getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(Integer idLoc) {
        this.idLoc = idLoc;
    }

    @Basic
    @Column(name = "data_adaugare")
    public String getDataAdaugare() {
        return dataAdaugare;
    }

    public void setDataAdaugare(String dataAdaugare) {
        this.dataAdaugare = dataAdaugare;
    }

    @Basic
    @Column(name = "data_recuperare")
    public String getDataRecuperare() {
        return dataRecuperare;
    }

    public void setDataRecuperare(String dataRecuperare) {
        this.dataRecuperare = dataRecuperare;
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
    @Column(name = "data_primire")
    public String getDataPrimire() {
        return dataPrimire;
    }

    public void setDataPrimire(String dataPrimire) {
        this.dataPrimire = dataPrimire;
    }

    @Basic
    @Column(name = "modificat_de")
    public String getModificatDe() {
        return modificatDe;
    }

    public void setModificatDe(String modificatDe) {
        this.modificatDe = modificatDe;
    }

    @Basic
    @Column(name = "id_persoana")
    public Integer getIdPersoana() {
        return idPersoana;
    }

    public void setIdPersoana(Integer idPersoana) {
        this.idPersoana = idPersoana;
    }

}
