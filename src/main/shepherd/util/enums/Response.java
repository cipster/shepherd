package util.enums;

import java.util.HashMap;
import java.util.Map;

public enum Response {
    ERROR(-1,"-1"),
    SUCCESS(1,"1"),
    EXISTS(-2,"-2"),
    EMPTY(-5,"");

    private int code;
    private String label;

    /**
     * A mapping between the integer code and its corresponding Status to facilitate lookup by code.
     */
    private static Map<Integer, Response> codeToStatusMapping;

    private Response(int code, String label) {
        this.code = code;
        this.label = label;
    }

    public static Response getStatus(int i) {
        if (codeToStatusMapping == null) {
            initMapping();
        }
        return codeToStatusMapping.get(i);
    }

    private static void initMapping() {
        codeToStatusMapping = new HashMap<>();
        for (Response s: values()) {
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
        sb.append("Response");
        sb.append("{code=").append(code);
        sb.append(", label='").append(label).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
