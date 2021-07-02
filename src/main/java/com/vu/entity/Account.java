package com.vu.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;


@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Accounts")

public class Account  implements Serializable{
	@Id
	@NotEmpty(message = " Use name  not Empty")
	String username;
	@NotEmpty(message = " Pass name  not Empty")
	@Size(min = 6, message = " Mat khau phai 6 ki tu tro len")
	String password;
	String fullname;
	@NotEmpty(message = " Email name  not Empty")
	@Email(message = " Email khong dung ding dang")
	String email;
	String photo;
	boolean admin;
	boolean activated;
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Order> orders;
}
