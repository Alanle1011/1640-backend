package com.example.backend1640.controller;

import com.example.backend1640.dto.CreateSubmissionPeriodDTO;
import com.example.backend1640.dto.ReadSubmissionPeriodDTO;
import com.example.backend1640.dto.SubmissionPeriodDTO;
import com.example.backend1640.service.SubmissionPeriodService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("submission_period")
public class SubmissionPeriodController {
    private final SubmissionPeriodService submissionPeriodService;

    public SubmissionPeriodController(SubmissionPeriodService submissionPeriodService) {
        this.submissionPeriodService = submissionPeriodService;
    }

    @PostMapping
    public SubmissionPeriodDTO createSubmissionPeriod(@Validated @RequestBody CreateSubmissionPeriodDTO submissionPeriodDTO) throws ParseException {
        return submissionPeriodService.createSubmissionPeriod(submissionPeriodDTO);
    }

    @GetMapping
    public List<ReadSubmissionPeriodDTO> getSubmissionPeriod() {
        return submissionPeriodService.findAll();
    }

    @DeleteMapping
    public void deleteSubmissionPeriod(@RequestParam Long id) {
        submissionPeriodService.deleteSubmissionPeriod(id);
    }
}
