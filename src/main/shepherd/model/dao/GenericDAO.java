package model.dao;

import org.springframework.dao.DataAccessException;

public interface GenericDAO<T, ID> {

    T findByID(ID id) throws DataAccessException;

    ID create(T entity) throws DataAccessException;

    Integer update(T entity) throws DataAccessException;

    Integer deleteByID(ID id) throws DataAccessException;

}
