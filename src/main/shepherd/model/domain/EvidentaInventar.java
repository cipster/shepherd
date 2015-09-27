package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "evidenta_inventar", schema = "", catalog = "proiecte")
public class EvidentaInventar {
    private long idEvidentaInventar;
    private Long idCod3;
    private Long idPersoana;
    private Long idLoc;
    private Long idLocRecuperare;
    private String dataPreluarii;
    private String dataRecuperarii;
    private String detalii;
    private String detaliiRecuperare;

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
    public Long getIdCod3() {
        return idCod3;
    }

    public void setIdCod3(Long idCod3) {
        this.idCod3 = idCod3;
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
    @Column(name = "id_loc")
    public Long getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(Long idLoc) {
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

    @Basic
    @Column(name = "detalii_recuperare")
    public String getDetaliiRecuperare() {
        return detaliiRecuperare;
    }

    public void setDetaliiRecuperare(String detaliiRecuperare) {
        this.detaliiRecuperare = detaliiRecuperare;
    }

    @Basic
    @Column(name = "id_loc_recuperare")
    public Long getIdLocRecuperare() {
        return idLocRecuperare;
    }

    public void setIdLocRecuperare(Long idLocRecuperare) {
        this.idLocRecuperare = idLocRecuperare;
    }
}
