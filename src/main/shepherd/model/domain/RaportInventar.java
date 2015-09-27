package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "raport_inventar", schema = "", catalog = "proiecte")
public class RaportInventar {
    private long idRaporInventar;
    private int cod1;
    private String cat1;
    private int cod2;
    private String cat2;
    private String denumire;
    private String barcode;
    private String detalii;
    private int idPersoana;
    private String nume;
    private int idLoc;
    private String denumireLoc;
    private String dataPrimire;
    private String detaliiRecuperare;

    @Basic
    @Column(name = "cod1", nullable = false, insertable = true, updatable = true)
    public int getCod1() {
        return cod1;
    }

    public void setCod1(int cod1) {
        this.cod1 = cod1;
    }

    @Basic
    @Column(name = "cat1", nullable = true, insertable = true, updatable = true, length = 255)
    public String getCat1() {
        return cat1;
    }

    public void setCat1(String cat1) {
        this.cat1 = cat1;
    }

    @Basic
    @Column(name = "cod2", nullable = false, insertable = true, updatable = true)
    public int getCod2() {
        return cod2;
    }

    public void setCod2(int cod2) {
        this.cod2 = cod2;
    }

    @Basic
    @Column(name = "cat2", nullable = true, insertable = true, updatable = true, length = 255)
    public String getCat2() {
        return cat2;
    }

    public void setCat2(String cat2) {
        this.cat2 = cat2;
    }

    @Basic
    @Column(name = "denumire", nullable = false, insertable = true, updatable = true, length = 255)
    public String getDenumire() {
        return denumire;
    }

    public void setDenumire(String denumire) {
        this.denumire = denumire;
    }

    @Basic
    @Column(name = "barcode", nullable = false, insertable = true, updatable = true, length = 255)
    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    @Basic
    @Column(name = "detalii", nullable = true, insertable = true, updatable = true, length = 255)
    public String getDetalii() {
        return detalii;
    }

    public void setDetalii(String detalii) {
        this.detalii = detalii;
    }

    @Basic
    @Column(name = "nume", nullable = true, insertable = true, updatable = true, length = 255)
    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    @Basic
    @Column(name = "id_loc", nullable = false, insertable = true, updatable = true)
    public int getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(int idLoc) {
        this.idLoc = idLoc;
    }

    @Basic
    @Column(name = "denumire_loc", nullable = true, insertable = true, updatable = true, length = 255)
    public String getDenumireLoc() {
        return denumireLoc;
    }

    public void setDenumireLoc(String denumireLoc) {
        this.denumireLoc = denumireLoc;
    }

    @Basic
    @Column(name = "data_primire", nullable = true, insertable = true, updatable = true)
    public String getDataPrimire() {
        return dataPrimire;
    }

    public void setDataPrimire(String dataPrimire) {
        this.dataPrimire = dataPrimire;
    }

    @Basic
    @Column(name = "detalii_recuperare", nullable = true, insertable = true, updatable = true, length = 65535)
    public String getDetaliiRecuperare() {
        return detaliiRecuperare;
    }

    public void setDetaliiRecuperare(String detaliiRecuperare) {
        this.detaliiRecuperare = detaliiRecuperare;
    }

    @Basic
    @Column(name = "id_persoana", nullable = false, insertable = true, updatable = true)
    public int getIdPersoana() {
        return idPersoana;
    }

    public void setIdPersoana(int idPersoana) {
        this.idPersoana = idPersoana;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof RaportInventar)) return false;

        RaportInventar that = (RaportInventar) o;

        if (cod1 != that.cod1) return false;
        if (cod2 != that.cod2) return false;
        if (idPersoana != that.idPersoana) return false;
        if (idLoc != that.idLoc) return false;
        if (cat1 != null ? !cat1.equals(that.cat1) : that.cat1 != null) return false;
        if (cat2 != null ? !cat2.equals(that.cat2) : that.cat2 != null) return false;
        if (denumire != null ? !denumire.equals(that.denumire) : that.denumire != null) return false;
        if (barcode != null ? !barcode.equals(that.barcode) : that.barcode != null) return false;
        if (detalii != null ? !detalii.equals(that.detalii) : that.detalii != null) return false;
        if (nume != null ? !nume.equals(that.nume) : that.nume != null) return false;
        if (denumireLoc != null ? !denumireLoc.equals(that.denumireLoc) : that.denumireLoc != null) return false;
        if (dataPrimire != null ? !dataPrimire.equals(that.dataPrimire) : that.dataPrimire != null) return false;
        return !(detaliiRecuperare != null ? !detaliiRecuperare.equals(that.detaliiRecuperare) : that.detaliiRecuperare != null);

    }

    @Override
    public int hashCode() {
        int result = cod1;
        result = 31 * result + (cat1 != null ? cat1.hashCode() : 0);
        result = 31 * result + cod2;
        result = 31 * result + (cat2 != null ? cat2.hashCode() : 0);
        result = 31 * result + (denumire != null ? denumire.hashCode() : 0);
        result = 31 * result + (barcode != null ? barcode.hashCode() : 0);
        result = 31 * result + (detalii != null ? detalii.hashCode() : 0);
        result = 31 * result + idPersoana;
        result = 31 * result + (nume != null ? nume.hashCode() : 0);
        result = 31 * result + idLoc;
        result = 31 * result + (denumireLoc != null ? denumireLoc.hashCode() : 0);
        result = 31 * result + (dataPrimire != null ? dataPrimire.hashCode() : 0);
        result = 31 * result + (detaliiRecuperare != null ? detaliiRecuperare.hashCode() : 0);
        return result;
    }

    @Id
    @Column(name = "id_raport_inventar", nullable = false, insertable = true, updatable = true)
    public long getIdRaporInventar() {
        return idRaporInventar;
    }

    public void setIdRaporInventar(long idRaporInventar) {
        this.idRaporInventar = idRaporInventar;
    }
}
