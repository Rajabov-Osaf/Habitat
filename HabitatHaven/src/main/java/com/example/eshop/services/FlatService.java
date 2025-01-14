package com.example.eshop.services;

import com.example.eshop.models.Category;
import com.example.eshop.models.Flat;
import com.example.eshop.models.Image;
import com.example.eshop.models.User;
import com.example.eshop.repositories.CategoryRepository;
import com.example.eshop.repositories.FlatRepository;
import com.example.eshop.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class FlatService {
    private final FlatRepository flatRepository;
    private final UserRepository userRepository;
    private final CategoryRepository categoryRepository;


    public List<Flat> listFlats(String title) {
        if (title != null) {
            List<Flat> flats = flatRepository.findAll();
            List<Flat> findFlats = new ArrayList<>();
            for (Flat flat : flats) {
                if (flat.getTitle().contains(title)) {
                    findFlats.add(flat);
                }
            }
            return findFlats;

        }
        return flatRepository.findAll();
    }

    public List<Flat> getFlatsByCategory(String title) {
        return flatRepository.findByCategoryTitle(title);
    }

    public void saveFlat(Principal principal, Flat flat,
                            MultipartFile[] files,
                            Long categoryId) throws IOException {
        flat.setUser(getUserByPrincipal(principal));
        flat.setCategory(categoryRepository.getReferenceById(categoryId));
        for (MultipartFile file : files) {
            if (file.getSize() != 0) {
                Image image = toImageEntity(file);
                flat.addImageToFlat(image);
            }
        }
        Flat savedFlat = flatRepository.save(flat);

        if (!savedFlat.getImages().isEmpty()) {
            savedFlat.setPreviewImageId(savedFlat.getImages().get(0).getId());
            flatRepository.save(savedFlat);
        }
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteFlat(Long id) {
        flatRepository.deleteById(id);
    }

    public Flat getFlatById(Long id) {
        return flatRepository.findById(id).orElse(null);
    }

    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }
}
