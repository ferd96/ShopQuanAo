package com.vu.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vu.entity.*;

public interface CategoryDAO extends JpaRepository<Category, String>{
}
