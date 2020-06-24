package com.flight.system.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.flight.system.model.Cities;
@Repository
public interface CitiesRepo extends JpaRepository<Cities, String> {
@Query(value = "SELECT city_code from cities",nativeQuery = true)
  List<String> getAllCityCode();
	Cities findByCityCode(String cityCode);
	
}
