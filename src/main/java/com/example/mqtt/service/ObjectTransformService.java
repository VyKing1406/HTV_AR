package com.example.mqtt.service;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mqtt.dto.ObjectContentDto;
import com.example.mqtt.dto.ObjectTransfromDto;
import com.example.mqtt.entity.ObjectContentEntity;
import com.example.mqtt.entity.ObjectTransformEntity;
import com.example.mqtt.entity.StationEntity;
import com.example.mqtt.repository.ObjectTransformRepository;
import com.example.mqtt.repository.StationRepository;

@Service
public class ObjectTransformService {

    private ModelMapper modelMapper;
    private ObjectTransformRepository objectTransformRepository;
    private StationRepository stationRepository;

    @Autowired
    public ObjectTransformService(
            ModelMapper modelMapper, ObjectTransformRepository objectTransformRepository,
            StationRepository stationRepository) {
        this.modelMapper = modelMapper;
        this.objectTransformRepository = objectTransformRepository;
        this.stationRepository = stationRepository;
    }

    public void saveObjectTransform(ObjectTransfromDto objectTransfromDto) {
        ObjectTransformEntity objectTransformEntity = modelMapper.map(objectTransfromDto, ObjectTransformEntity.class);
        Optional<StationEntity> station = stationRepository.findById(objectTransfromDto.getStationId());
        if (station.get() != null) {
            objectTransformEntity.setStation(station.get());
            for (ObjectContentEntity objectContentEntity : objectTransformEntity.getContents()) {
                objectContentEntity.setObjectTransform(objectTransformEntity);
            }
            objectTransformRepository.save(objectTransformEntity);
        }
    }

    public List<ObjectTransfromDto> getObjectTransform(Long StationId) {
        Optional<StationEntity> station = stationRepository.findById(StationId);
        if (station.isPresent()) {
            List<ObjectTransformEntity> transformEntities = objectTransformRepository.findByStationId(StationId);
            return modelMapper.map(transformEntities, new TypeToken<List<ObjectTransfromDto>>() {
            }.getType());
        }
        return null;
    }
}
