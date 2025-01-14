package com.example.eshop.repositories;

import com.example.eshop.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImagesRepository extends JpaRepository<Image, Long> {

}
