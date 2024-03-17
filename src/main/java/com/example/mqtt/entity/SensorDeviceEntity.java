package com.example.mqtt.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Data
@NoArgsConstructor
@Entity
@Table(name = "sensor_device")
public class SensorDeviceEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "sensor_id", nullable = false)
    private String sensorid;

    @Column(name = "sensor_name", nullable = false)
    private String sensorname;

    @Column(name = "sensor_unit", nullable = false)
    private String sensorUnit;

    @ManyToOne
    @JoinColumn(name = "station_id")
    private StationEntity station;
}