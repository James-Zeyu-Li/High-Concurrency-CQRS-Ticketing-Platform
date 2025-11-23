package org.java.queryservice.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

@Configuration
public class RedisConfig {
  
  @Bean
  public RedisTemplate<String, byte[]> bitmapRedisTemplate(
          RedisConnectionFactory redisConnectionFactory) {
    RedisTemplate<String, byte[]> redisTemplate = new RedisTemplate<>();
    redisTemplate.setConnectionFactory(redisConnectionFactory);
    redisTemplate.setKeySerializer(new StringRedisSerializer());
    redisTemplate.setValueSerializer(RedisSerializer.byteArray());
    redisTemplate.afterPropertiesSet();
    return redisTemplate;
  }
}
