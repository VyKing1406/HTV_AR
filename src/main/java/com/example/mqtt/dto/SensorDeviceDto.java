package com.example.mqtt.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class SensorDeviceDto {
    private Long id;
    private String sensor_id;
    private String sensor_name;
    private String sensor_unit;
    private Long station_id;
}
