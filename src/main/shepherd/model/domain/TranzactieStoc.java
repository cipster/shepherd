package model.domain;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "tranzactie_stoc", schema = "", catalog = "raindrop")
public class TranzactieStoc {
    private long idTranzactieStoc;
    private Colet idColet;
    private Stoc idStoc;
    private Loc idLoc;
    private ResurseUmane idResurseUmane;
    private StareStoc idStare;
    private StareStoc idStareAnterioara;
    private String detalii;
    private Timestamp dataTranzactie;
    private String creatDe;
    private Timestamp creatLa;
    private String modificatDe;
    private Timestamp modificatLa;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_tranzactie_stoc", nullable = false, insertable = true, updatable = true)
    public long getIdTranzactieStoc() {
        return idTranzactieStoc;
    }

    public void setIdTranzactieStoc(long idTranzactieStoc) {
        this.idTranzactieStoc = idTranzactieStoc;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_colet")
    public Colet getIdColet() {
        return idColet;
    }

    public void setIdColet(Colet idColet) {
        this.idColet = idColet;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_stoc")
    public Stoc getIdStoc() {
        return idStoc;
    }

    public void setIdStoc(Stoc idStoc) {
        this.idStoc = idStoc;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_loc")
    public Loc getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(Loc idLoc) {
        this.idLoc = idLoc;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_resurse_umnane")
    public ResurseUmane getIdResurseUmane() {
        return idResurseUmane;
    }

    public void setIdResurseUmane(ResurseUmane idResurseUmane) {
        this.idResurseUmane = idResurseUmane;
    }

    @Basic
    @Column(name = "data_tranzactie", nullable = false, insertable = true, updatable = true)
    public Timestamp getDataTranzactie() {
        return dataTranzactie;
    }

    public void setDataTranzactie(Timestamp dataTranzactie) {
        this.dataTranzactie = dataTranzactie;
    }

    @Basic
    @Column(name = "creat_de", nullable = false, insertable = true, updatable = true, length = 150)
    public String getCreatDe() {
        return creatDe;
    }

    public void setCreatDe(String creatDe) {
        this.creatDe = creatDe;
    }

    @Basic
    @Column(name = "creat_la", nullable = false, insertable = true, updatable = true)
    public Timestamp getCreatLa() {
        return creatLa;
    }

    public void setCreatLa(Timestamp creatLa) {
        this.creatLa = creatLa;
    }

    @Basic
    @Column(name = "modificat_de", nullable = true, insertable = true, updatable = true, length = 150)
    public String getModificatDe() {
        return modificatDe;
    }

    public void setModificatDe(String modificatDe) {
        this.modificatDe = modificatDe;
    }

    @Basic
    @Column(name = "modificat_la", nullable = true, insertable = true, updatable = true)
    public Timestamp getModificatLa() {
        return modificatLa;
    }

    public void setModificatLa(Timestamp modificatLa) {
        this.modificatLa = modificatLa;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_stare")
    public StareStoc getIdStare() {
        return idStare;
    }

    public void setIdStare(StareStoc idStare) {
        this.idStare = idStare;
    }


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_stare_anterioara")
    public StareStoc getIdStareAnterioara() {
        return idStareAnterioara;
    }

    public void setIdStareAnterioara(StareStoc idStareAnterioara) {
        this.idStareAnterioara = idStareAnterioara;
    }

    @Basic
    @Column(name = "detalii", nullable = false, insertable = true, updatable = true)
    public String getDetalii() {
        return detalii;
    }

    public void setDetalii(String detalii) {
        this.detalii = detalii;
    }
}
