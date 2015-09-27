package model.domain;

import javax.persistence.*;

@Entity
@Table(name = "cod_2", schema = "", catalog = "proiecte")
public class Cod2 {
    private long idCod2;
    private Long cod1;
    private Long cod2;
    private String denumire2;

    @Id
    @Column(name = "id_cod_2")
    public long getIdCod2() {
        return idCod2;
    }

    public void setIdCod2(long idCod2) {
        this.idCod2 = idCod2;
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
    @Column(name = "denumire_2")
    public String getDenumire2() {
        return denumire2;
    }

    public void setDenumire2(String denumire2) {
        this.denumire2 = denumire2;
    }
}
