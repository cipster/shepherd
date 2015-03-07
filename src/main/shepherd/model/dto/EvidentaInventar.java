package model.dto;

import javax.persistence.*;

/**
 * Created by Ciprian on 12/14/2014.
 * Project Raindrop
 */
@Entity
@Table(name = "evidenta_inventar", schema = "", catalog = "proiecte")
public class EvidentaInventar {
    private long idEvidentaInventar;
    private int idCod3;
    private int idPersoana;
    private int idLoc;
    private String dataPreluarii;
    private String dataRecuperarii;
    private String detalii;

    @Id
    @Column(name = "id_evidenta_inventar")
    public long getIdEvidentaInventar() {
        return idEvidentaInventar;
    }

    public void setIdEvidentaInventar(long idEvidentaInventar) {
        this.idEvidentaInventar = idEvidentaInventar;
    }

    @Basic
    @Column(name = "id_cod_3")
    public int getIdCod3() {
        return idCod3;
    }

    public void setIdCod3(int idCod3) {
        this.idCod3 = idCod3;
    }

    @Basic
    @Column(name = "id_persoana")
    public int getIdPersoana() {
        return idPersoana;
    }

    public void setIdPersoana(int idPersoana) {
        this.idPersoana = idPersoana;
    }

    @Basic
    @Column(name = "id_loc")
    public int getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(int idLoc) {
        this.idLoc = idLoc;
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

        EvidentaInventar that = (EvidentaInventar) o;

        if (idCod3 != that.idCod3) return false;
        if (idEvidentaInventar != that.idEvidentaInventar) return false;
        if (idLoc != that.idLoc) return false;
        if (idPersoana != that.idPersoana) return false;
        if (dataPreluarii != null ? !dataPreluarii.equals(that.dataPreluarii) : that.dataPreluarii != null)
            return false;
        if (detalii != null ? !detalii.equals(that.detalii) : that.detalii != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idEvidentaInventar ^ (idEvidentaInventar >>> 32));
        result = 31 * result + idCod3;
        result = 31 * result + idPersoana;
        result = 31 * result + idLoc;
        result = 31 * result + (dataPreluarii != null ? dataPreluarii.hashCode() : 0);
        result = 31 * result + (detalii != null ? detalii.hashCode() : 0);
        return result;
    }
}
