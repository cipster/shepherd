package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "cod_3", schema = "", catalog = "proiecte")
public class Cod3 {
    private long idCod3;
    private Long cod1;
    private Long cod2;
    private Long cod3;
    private String denumire3;
    private String barcode;
    private String detalii;
    private String pretAchizitie;
    private Integer stare;
    private String factura;
    private String detaliiRecuperare;
    private Long idLoc;
    private Long idPersoana;
    private String dataAdaugare;
    private String dataRecuperare;
    private String dataPrimire;
    private String creatDe;
    private String modificatDe;

    @Basic
    @Column(name = "factura")
    public String getFactura() {
        return factura;
    }

    public void setFactura(String factura) {
        this.factura = factura;
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
    @Column(name = "id_loc")
    public Long getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(Long idLoc) {
        this.idLoc = idLoc;
    }

    @Basic
    @Column(name = "id_persoana")
    public Long getIdPersoana() {
        return idPersoana;
    }

    public void setIdPersoana(Long idPersoana) {
        this.idPersoana = idPersoana;
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
    @Column(name = "creat_de")
    public String getCreatDe() {
        return creatDe;
    }

    public void setCreatDe(String creatDe) {
        this.creatDe = creatDe;
    }

    @Basic
    @Column(name = "modificat_de")
    public String getModificatDe() {
        return modificatDe;
    }

    public void setModificatDe(String modificatDe) {
        this.modificatDe = modificatDe;
    }

    @Id
    @Column(name = "id_cod_3")
    public long getIdCod3() {
        return idCod3;
    }

    public void setIdCod3(long idCod3) {
        this.idCod3 = idCod3;
    }

    @Basic
    @Column(name = "cod_1")
    public Long getCod1() {
        return cod1;
    }

    public void setCod1(Long cod1) {
        this.cod1 = cod1;
    }

    @Basic
    @Column(name = "cod_2")
    public Long getCod2() {
        return cod2;
    }

    public void setCod2(Long cod2) {
        this.cod2 = cod2;
    }

    @Basic
    @Column(name = "cod_3")
    public Long getCod3() {
        return cod3;
    }

    public void setCod3(Long cod3) {
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
    @Column(name ="stare")
    public int getStare() {
        return stare;
    }

    public void setStare(int stare) {
        this.stare = stare;
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
    @Column(name = "data_primire")
    public String getDataPrimire() {
        return dataPrimire;
    }

    public void setDataPrimire(String dataPrimire) {
        this.dataPrimire = dataPrimire;
    }

}
