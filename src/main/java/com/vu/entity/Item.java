package com.vu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Item {
	//1. khai báo dữ liệu của món hàng
	Integer id;
	String name;
	double price;
	String image;
	int qty = 1; //2. mặc định số lượng là 1
}