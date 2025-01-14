package com.example.eshop.controllers;

import com.example.eshop.models.Image;
import com.example.eshop.repositories.ImagesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayInputStream;

@RestController
@RequiredArgsConstructor
public class ImageController {
    private final ImagesRepository imagesRepository;

    @GetMapping("/images/{id}")
    private ResponseEntity<?> getImageById(@PathVariable Long id) {
        Image image = imagesRepository.findById(id).orElse(null);
        return  ResponseEntity.ok()
                .header("fileNmae", image.getOriginalFileName())
                .contentType(MediaType.valueOf((image.getContentType())))
                .contentLength((image.getSize()))
                .body(new InputStreamResource((new ByteArrayInputStream(image.getBytes()))));
    }
}
