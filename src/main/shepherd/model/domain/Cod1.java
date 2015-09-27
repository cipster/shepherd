package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "cod_1", schema = "", catalog = "proiecte")
public class Cod1 {
    private long idCod1;
    private Long cod1;
    private String denumire1;

    @Id
    @Column(name = "id_cod_1")
    public long getIdCod1() {
        return idCod1;
    }

    public void setIdCod1(long idCod1) {
        this.idCod1 = idCod1;
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
    @Column(name = "denumire_1")
    public String getDenumire1() {
        return denumire1;
    }

    public void setDenumire1(String denumire1) {
        this.denumire1 = denumire1;
    }
}
