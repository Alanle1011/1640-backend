package com.example.backend1640.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReadSubmissionPeriodDTO {
    private String name;
    private String startDate;
    private String closureDate;
    private String finalClosureDate;
}
