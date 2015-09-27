package model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "listaproiecte")
public class Proiect {

    private long idProiect;
    private String numeProiect;
    private String nrProiect;
    private String an;
    private Long idClient;
    private String idPropunere;
    private String idChestionarFinal;
    private String idRaportFinal;
    private String idBd;
    private String idAlteMateriale;

    @Id
    @Column(name = "id_proiect", nullable = false, insertable = true, updatable = true)
    public long getIdProiect() {
        return idProiect;
    }

    public void setIdProiect(long idProiect) {
        this.idProiect = idProiect;
    }

    @Basic
    @Column(name = "nume_proiect", nullable = false, insertable = true, updatable = true, length = 250)
    public String getNumeProiect() {
        return numeProiect;
    }

    public void setNumeProiect(String numeProiect) {
        this.numeProiect = numeProiect;
    }

    @Basic
    @Column(name = "nr_proiect", nullable = false, insertable = true, updatable = true, length = 45)
    public String getNrProiect() {
        return nrProiect;
    }

    public void setNrProiect(String nrProiect) {
        this.nrProiect = nrProiect;
    }

    @Basic
    @Column(name = "an", nullable = false, insertable = true, updatable = true, length = 4)
    public String getAn() {
        return an;
    }

    public void setAn(String an) {
        this.an = an;
    }

    @Basic
    @Column(name = "id_client", nullable = false, insertable = true, updatable = true)
    public Long getIdClient() {
        return idClient;
    }

    public void setIdClient(Long idClient) {
        this.idClient = idClient;
    }

    @Basic
    @Column(name = "id_propunere", nullable = true, insertable = true, updatable = true)
    public String getIdPropunere() {
        return idPropunere;
    }

    public void setIdPropunere(String idPropunere) {
        this.idPropunere = idPropunere;
    }

    @Basic
    @Column(name = "id_chestionar_final", nullable = true, insertable = true, updatable = true)
    public String getIdChestionarFinal() {
        return idChestionarFinal;
    }

    public void setIdChestionarFinal(String idChestionarFinal) {
        this.idChestionarFinal = idChestionarFinal;
    }

    @Basic
    @Column(name = "id_raport_final", nullable = true, insertable = true, updatable = true)
    public String getIdRaportFinal() {
        return idRaportFinal;
    }

    public void setIdRaportFinal(String idRaportFinal) {
        this.idRaportFinal = idRaportFinal;
    }

    @Basic
    @Column(name = "id_bd", nullable = true, insertable = true, updatable = true)
    public String getIdBd() {
        return idBd;
    }

    public void setIdBd(String idBd) {
        this.idBd = idBd;
    }

    @Basic
    @Column(name = "id_alte_materiale", nullable = true, insertable = true, updatable = true)
    public String getIdAlteMateriale() {
        return idAlteMateriale;
    }

    public void setIdAlteMateriale(String idAlteMateriale) {
        this.idAlteMateriale = idAlteMateriale;
    }

}
