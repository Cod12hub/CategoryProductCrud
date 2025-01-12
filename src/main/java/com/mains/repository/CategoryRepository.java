package com.mains.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mains.bin.Category;


public interface CategoryRepository extends JpaRepository<Category, Long> {

}
