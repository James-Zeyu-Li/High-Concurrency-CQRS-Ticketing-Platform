package org.java.queryservice.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ZoneDTO {
    private int zoneId;

    private Integer posX;
    private Integer posY;

    private Integer width; // colCount
    private Integer height; // rowCount

    private BigDecimal ticketPrice;

}
