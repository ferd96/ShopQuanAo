package com.vu.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vu.entity.*;

public interface OrderDAO extends JpaRepository<Order, Long>{
}
