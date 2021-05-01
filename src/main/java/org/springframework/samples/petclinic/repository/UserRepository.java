package org.springframework.samples.petclinic.repository;

import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.model.User;

public interface UserRepository {

    void save(User user) throws DataAccessException;
    User findByUsername(String username) throws DataAccessException;
    void delete(User user) throws DataAccessException;
}
