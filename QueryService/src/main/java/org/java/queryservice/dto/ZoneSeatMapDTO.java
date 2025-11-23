package org.java.queryservice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ZoneSeatMapDTO {

  /**
   * The seat map bitmap for a single zone, encoded as a Base64 string.
   */
  private String seatMapBase64;
}
