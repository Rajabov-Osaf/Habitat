package com.example.eshop.repositories;

import com.example.eshop.models.Flat;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FlatRepository extends JpaRepository<Flat, Long> {
    List<Flat> findByTitle(String title);

    List<Flat> findByCategoryTitle(String title);
}
