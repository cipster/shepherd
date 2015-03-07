package enums;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Ciprian on 2/21/2015.
 * Project Shepherd
 */
public enum StareArticol {
    STOC(1,"Stoc"),
    RECUPERAT(2,"Recuperat"),
    IN_FOLOSINTA(3,"In folosinta"),
    TRANZIT(4,"Tranzit"),
    DETERIORAT(5,"Deteriorat"),
    SERVICE(6,"Service"),
    DISPARUT(7,"Disparut"),
    CASAT(8,"Casat");

    private int code;
    private String label;

    /**
     * A mapping between the integer code and its corresponding Status to facilitate lookup by code.
     */
    private static Map<Integer, StareArticol> codeToStatusMapping;

    private StareArticol(int code, String label) {
        this.code = code;
        this.label = label;
    }

    public static StareArticol getStatus(int i) {
        if (codeToStatusMapping == null) {
            initMapping();
        }
        return codeToStatusMapping.get(i);
    }

    private static void initMapping() {
        codeToStatusMapping = new HashMap<Integer, StareArticol>();
        for (StareArticol s: values()) {
            codeToStatusMapping.put(s.code, s);
        }
    }

    public int getCode() {
        return code;
    }

    public String getLabel() {
        return label;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder();
        sb.append("StareArticol");
        sb.append("{code=").append(code);
        sb.append(", label='").append(label).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
