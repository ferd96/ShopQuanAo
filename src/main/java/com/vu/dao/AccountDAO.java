package com.vu.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vu.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String>{
}
