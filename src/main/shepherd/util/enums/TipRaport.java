package util.enums;

public enum TipRaport {
    DUPA_LOC(1),
    DUPA_PERSOANA(2),
    DUPA_CATEGORIE(3),
    GENERAL(4);

    private int code;

    TipRaport(int code) {
        this.code = code;
    }
}
