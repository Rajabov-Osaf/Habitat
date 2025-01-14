package com.example.eshop.controllers;

import com.example.eshop.models.Category;
import com.example.eshop.models.Flat;
import com.example.eshop.services.FlatService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class FlatController {

    private final FlatService flatService;

    @GetMapping("/")
    public String flats(
            @RequestParam(name = "title", required = false)
            String title, Model model, Principal principal) {
        model.addAttribute("flats",
                flatService.listFlats(title));
        model.addAttribute("user",
                flatService.getUserByPrincipal(principal));
        List<Category> categories = flatService.getAllCategories();
        model.addAttribute("categories", categories);
        return "flats";
    }

    @GetMapping("/flat/{id}")
    public String flatInfo(@PathVariable Long id, Model model) {
        Flat flat = flatService.getFlatById(id);
        model.addAttribute("images", flat.getImages());
        model.addAttribute("flat",
                flatService.getFlatById(id));
        return "flat-info";
    }

    @PostMapping("/flat/create")
    public String createFlat(@RequestParam("files") MultipartFile[] files,
                                @RequestParam("categoryId") Long categoryId,
                                Flat flat, Principal principal) throws IOException {
        flatService.saveFlat(principal, flat, files, categoryId);
        return "redirect:/";
    }

    @PostMapping("/flat/delete/{id}")
    public String deleteFlat(@PathVariable Long id) {
        flatService.deleteFlat(id);
        return "redirect:/";
    }

    @GetMapping("/category")
    public String getFlatsByCategory(
            @RequestParam(name = "categoryTitle", required = false) String title,
            Model model, Principal principal) {
        List<Flat> flats = new ArrayList<>();
        if (title != null) {
            model.addAttribute("flats",
                    flatService.getFlatsByCategory(title));
        } else flatService.listFlats(null);

        model.addAttribute("user",
                flatService.getUserByPrincipal(principal));
        List<Category> categories = flatService.getAllCategories();
        model.addAttribute("categories", categories);
        return "flats";
    }


}
