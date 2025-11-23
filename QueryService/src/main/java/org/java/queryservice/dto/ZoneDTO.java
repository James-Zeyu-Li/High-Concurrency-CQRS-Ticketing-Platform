package org.java.queryservice.dto;

import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ZoneDTO {

  /**
   * The Zone DTO with position and width + height.
   */

  private int zoneId;

  private Integer posX;
  private Integer posY;

  private Integer width; // colCount
  private Integer height; // rowCount

  private BigDecimal ticketPrice;

}
