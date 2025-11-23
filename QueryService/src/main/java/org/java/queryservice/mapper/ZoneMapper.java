package org.java.queryservice.mapper;

import org.java.queryservice.dto.ZoneDTO;
import org.java.queryservice.model.Zone;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;

import java.lang.annotation.Target;

@Mapper(componentModel = "spring")
public interface ZoneMapper {

    @Mapping(source = "colCount", target = "width")
    @Mapping(source = "rowCount", target = "height")
    ZoneDTO toZoneDto(Zone entity);
}