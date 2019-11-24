package com.hibernate.hibernate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.util.List;

@Service
public class GroupService  {


    public final UserRepository userRepository;

    @Autowired
    EntityManager entityManager;




    public GroupService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    public List find() {
       return userRepository.findJoin();

        }
    }



