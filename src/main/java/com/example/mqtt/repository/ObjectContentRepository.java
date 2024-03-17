package com.example.mqtt.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.mqtt.entity.ObjectContentEntity;


public interface ObjectContentRepository extends JpaRepository<ObjectContentEntity, Long>{
    
}
