package model.raport;

import java.util.Arrays;

public class RaportInventarForm {
    private int[] idLoc;
    private int[] idPersoana;
    private int[] cod1;
    private int[] cod2;
    private String orderBy;

    public int[] getIdLoc() {
        return idLoc;
    }

    public void setIdLoc(int[] idLoc) {
        this.idLoc = idLoc;
    }

    public int[] getIdPersoana() {
        return idPersoana;
    }

    public void setIdPersoana(int[] idPersoana) {
        this.idPersoana = idPersoana;
    }

    public int[] getCod1() {
        return cod1;
    }

    public void setCod1(int[] cod1) {
        this.cod1 = cod1;
    }

    public int[] getCod2() {
        return cod2;
    }

    public void setCod2(int[] cod2) {
        this.cod2 = cod2;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof RaportInventarForm)) return false;

        RaportInventarForm that = (RaportInventarForm) o;

        if (!Arrays.equals(idLoc, that.idLoc)) return false;
        if (!Arrays.equals(idPersoana, that.idPersoana)) return false;
        if (!Arrays.equals(cod1, that.cod1)) return false;
        if (!Arrays.equals(cod2, that.cod2)) return false;
        return !(orderBy != null ? !orderBy.equals(that.orderBy) : that.orderBy != null);

    }

    @Override
    public int hashCode() {
        int result = idLoc != null ? Arrays.hashCode(idLoc) : 0;
        result = 31 * result + (idPersoana != null ? Arrays.hashCode(idPersoana) : 0);
        result = 31 * result + (cod1 != null ? Arrays.hashCode(cod1) : 0);
        result = 31 * result + (cod2 != null ? Arrays.hashCode(cod2) : 0);
        result = 31 * result + (orderBy != null ? orderBy.hashCode() : 0);
        return result;
    }
}
