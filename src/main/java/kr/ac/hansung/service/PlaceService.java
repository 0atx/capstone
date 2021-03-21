package kr.ac.hansung.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.PlaceDao;
import kr.ac.hansung.model.Place;

@Service
public class PlaceService {

	@Autowired
	private PlaceDao placeDao;
	
	public List<Place> getCurrent() {
		return placeDao.getPlaces();
	}

	public void insert(Place place) {
		placeDao.insert(place);
	}
	
	public void delete() {
		//courseDao.delete("웹프레임워크2");
	}
	
}