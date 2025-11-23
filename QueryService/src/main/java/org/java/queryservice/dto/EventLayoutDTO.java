package org.java.queryservice.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EventLayoutDTO {
    private int version;
    private String bits;
    private int width;
    private int height;
}
