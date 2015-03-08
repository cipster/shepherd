package exceptions;

/**
 * Created by Ciprian on 3/7/2015.
 * Project Raindrop
 */
public class DAOException extends RuntimeException{
    public DAOException(String message) {
        super(message);
    }
}
