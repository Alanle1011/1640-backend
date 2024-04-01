package com.example.backend1640.controller;

import com.example.backend1640.entity.Image;
import com.example.backend1640.service.ImageService;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("image")
public class ImageController {
    private final ImageService imageService;

    public ImageController(ImageService imageService) {
        this.imageService = imageService;
    }

    @GetMapping
    public String getAllImage(Model model) {
        List<Image> images = imageService.getAllImages();
        model.addAttribute("images", images);
        return "image";
    }

    @PostMapping
    public String saveImage(@RequestParam("images") MultipartFile[] files, @RequestParam(value = "contributionId", required=false) String contributionId, @RequestParam(value = "userId", required=false) String userId) throws IOException {
        if (contributionId ==null && userId == null) {
            throw new IllegalArgumentException();
        }

        if (contributionId != null) {
            for (MultipartFile file : files) {
                imageService.saveImage(file, contributionId);
            }
        }

        if (userId != null) {
            for (MultipartFile file : files) {
                imageService.saveUserImage(file, userId);
            }
        }
        return "redirect:/";
    }


    @PutMapping()
    public void updateImage(@RequestParam("images") MultipartFile[] files, @RequestParam(value = "imageId", required = true) String imageId) throws IOException {
        for (MultipartFile file : files) {
            imageService.updateImage(file, imageId);
        }
    }

    @GetMapping("/download/{id}")
    public ResponseEntity<ByteArrayResource> downloadImage(@PathVariable long id) {
        Image image = imageService.getImage(id).get();
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(image.getType()))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment: filename=\"" + image.getName() + "\"")
                .body(new ByteArrayResource(image.getData()));
    }

    @GetMapping("/user/{id}")
    public ResponseEntity<ByteArrayResource> getUserImage(@PathVariable long id) {
        Image image = imageService.getImageByUserId(id);
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(image.getType()))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment: filename=\"" + image.getName() + "\"")
                .body(new ByteArrayResource(image.getData()));
    }
}
