package com.vu.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Categories")
public class Category implements Serializable{
	@Id
	@NotNull
	@NotBlank(message="id can not be empty")
	String id;
	@NotBlank(message="Name can not be empty")
	String name;
	@JsonIgnore
	@OneToMany(mappedBy = "category")
	List<Product> products;
}
