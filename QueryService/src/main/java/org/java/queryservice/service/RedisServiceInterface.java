package org.java.queryservice.service;

public interface RedisServiceInterface {
  byte[] getZoneSeatMap(String eventId, int zoneId);
}
