package com.hibernate.hibernate;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {



    @Query("select User from User u join  u.id")
    List<User> find();

    @Query(value = "SELECT * From usr", nativeQuery = true)
    List<User> findNative();

    @Query(value = "SELECT u.first_name From usr u join users_role ur on u.id = ur.user_id join role r on ur.group_id = r.id", nativeQuery = true)
    List findJoin();


}
