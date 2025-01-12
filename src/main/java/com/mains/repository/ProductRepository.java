package com.mains.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mains.bin.Product;



public interface ProductRepository extends JpaRepository<Product, Long> {

}
