package org.java.queryservice.service.redisGet;

public class RedisKeyUtil {

  public static String getZoneBitMapKey(String eventId, int zoneId) {
    return String.format("event:%s:zone:%s:occupied", eventId, zoneId);
  }

}