package model.dao;

public interface GenericDAO<T, ID> {

    T findByID(ID id);

    ID create(T entity);

    Integer update(T entity);

    Integer deleteByID(ID id);

}
