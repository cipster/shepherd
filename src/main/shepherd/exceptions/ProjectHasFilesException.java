package exceptions;

/**
 * @author Ciprian on 3/15/2015.
 * @description
 * ${PROJECT_NAME}
 */
public class ProjectHasFilesException extends RuntimeException {
    public ProjectHasFilesException(String message) {
        super(message);
    }
}
