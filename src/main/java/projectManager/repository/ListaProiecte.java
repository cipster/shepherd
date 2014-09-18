package projectManager.repository;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "listaproiecte")
public class ListaProiecte {

    private int idProiect;
    private String numeProiect;
    private String nrProiect;
    private String an;
    private int idClient;
    private String idPropunere;
    private String idChestionarFinal;
    private String idRaportFinal;
    private String idBd;
    private String idAlteMateriale;

    @Id
    @Column(name = "id_proiect", nullable = false, insertable = true, updatable = true)
    public int getIdProiect() {
        return idProiect;
    }

    public void setIdProiect(int idProiect) {
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
    public int getIdClient() {
        return idClient;
    }

    public void setIdClient(int idClient) {
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

    @Override
    public int hashCode() {
        int result = idProiect;
        result = 31 * result + (numeProiect != null ? numeProiect.hashCode() : 0);
        result = 31 * result + (nrProiect != null ? nrProiect.hashCode() : 0);
        result = 31 * result + (an != null ? an.hashCode() : 0);
        result = 31 * result + idClient;
        result = 31 * result + (idPropunere != null ? idPropunere.hashCode() : 0);
        result = 31 * result + (idChestionarFinal != null ? idChestionarFinal.hashCode() : 0);
        result = 31 * result + (idRaportFinal != null ? idRaportFinal.hashCode() : 0);
        result = 31 * result + (idBd != null ? idBd.hashCode() : 0);
        result = 31 * result + (idAlteMateriale != null ? idAlteMateriale.hashCode() : 0);
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || getClass() != o.getClass()) return false;

        ListaProiecte that = (ListaProiecte) o;

        if(idClient != that.idClient) return false;
        if(idProiect != that.idProiect) return false;
        if(an != null ? !an.equals(that.an) : that.an != null) return false;
        if(idAlteMateriale != null ? !idAlteMateriale.equals(that.idAlteMateriale) : that.idAlteMateriale != null) {
            return false;
        }
        if(idBd != null ? !idBd.equals(that.idBd) : that.idBd != null) return false;
        if(idChestionarFinal != null ? !idChestionarFinal.equals(that.idChestionarFinal) : that.idChestionarFinal != null) {
            return false;
        }
        if(idPropunere != null ? !idPropunere.equals(that.idPropunere) : that.idPropunere != null) return false;
        if(idRaportFinal != null ? !idRaportFinal.equals(that.idRaportFinal) : that.idRaportFinal != null) return false;
        if(nrProiect != null ? !nrProiect.equals(that.nrProiect) : that.nrProiect != null) return false;
        if(numeProiect != null ? !numeProiect.equals(that.numeProiect) : that.numeProiect != null) return false;

        return true;
    }
}
