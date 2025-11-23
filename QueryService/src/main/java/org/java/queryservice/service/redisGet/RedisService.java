package org.java.queryservice.service.redisGet;

import lombok.extern.slf4j.Slf4j;
import org.java.queryservice.service.RedisServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class RedisService  implements RedisServiceInterface {

  private final RedisTemplate<String, byte[]> redisTemplate;

  @Autowired
  public RedisService(@Qualifier("bitmapRedisTemplate") RedisTemplate<String, byte[]> redisTemplate) {
    this.redisTemplate = redisTemplate;
  }

  public byte[] getZoneSeatMap(String eventId, int zoneId) {
    String key = RedisKeyUtil.getZoneBitMapKey(eventId, zoneId);
    return redisTemplate.opsForValue().get(key);
  }
}