package com.example.mqtt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.mqtt.dto.ObjectTransfromDto;
import com.example.mqtt.service.ObjectTransformService;

@RestController
@RequestMapping("/api/object")
public class ObjectPositionController {
    private ObjectTransformService objectTransformService;

    @Autowired
    public ObjectPositionController(ObjectTransformService objectTransformService) {
        this.objectTransformService = objectTransformService;
    }


    @PostMapping(value = "/transform")
    public ResponseEntity<String> saveTransform(@RequestBody ObjectTransfromDto data) {
        try {
            objectTransformService.saveObjectTransform(data);
            return ResponseEntity.status(HttpStatus.CREATED).body("Created successfully");
        } catch (Exception e) {
            // Xử lý lỗi và trả về ResponseEntity lỗi với mã HTTP 400 Bad Request
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Error: " + e.getMessage());
        }
    }

    @GetMapping(value = "/transform/{stationId}")
    public ResponseEntity<List<ObjectTransfromDto>> getTransform(@PathVariable("stationId") Long stationId) {
        try {
            List<ObjectTransfromDto> getObjectTransform = objectTransformService.getObjectTransform(stationId);
            return ResponseEntity.status(HttpStatus.OK).body(getObjectTransform);
        } catch (Exception e) {
            // Xử lý lỗi và trả về ResponseEntity lỗi với mã HTTP 400 Bad Request
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
    }

}
