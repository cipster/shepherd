package projectManager.enums;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Ciprian on 3/2/2015.
 * Project Shepherd
 */
public enum RoleType {
    ROLE_ADMIN(2,"ADMIN", "ROLE_ADMIN"),
    ROLE_USER(3,"USER", "ROLE_USER"),
    ROLE_DOWNLOAD(7,"DOWNLOAD", "ROLE_DOWNLOAD"),
    ROLE_SUPERUSER(8,"SUPERUSER", "ROLE_SUPERUSER"),
    ROLE_INVENTAR(9,"INVENTAR", "ROLE_INVENTAR");

    private int code;
    private String label;
    private String fullName;

    /**
     * A mapping between the integer code and its corresponding Status to facilitate lookup by code.
     */
    private static Map<Integer, RoleType> codeToStatusMapping;

    private RoleType(int code, String label, String fullName) {
        this.code = code;
        this.label = label;
        this.fullName = fullName;
    }

    public static RoleType getStatus(int i) {
        if (codeToStatusMapping == null) {
            initMapping();
        }
        return codeToStatusMapping.get(i);
    }

    private static void initMapping() {
        codeToStatusMapping = new HashMap<Integer, RoleType>();
        for (RoleType s: values()) {
            codeToStatusMapping.put(s.code, s);
        }
    }

    public int getCode() {
        return code;
    }

    public String getLabel() {
        return label;
    }
    
    public String getFullName() {
        return fullName;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder();
        sb.append("RoleType");
        sb.append("{code=").append(code);
        sb.append(", label='").append(label).append('\'');
        sb.append(", fullName='").append(fullName).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
