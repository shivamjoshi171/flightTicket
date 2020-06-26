package com.flight.system.repos;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.flight.system.model.Flight;

@Repository
public interface FlightRepo extends JpaRepository<Flight, String> {
	
	
	@Query(value = "SELECT * FROM FLIGHT WHERE DEPARTURE_CITY=:dep AND ARIVAL_CITY=:ar AND airline_id is not null",nativeQuery = true)
	public Collection<Flight> getAllFlight(@Param("dep")String de, @Param("ar") String ar);
	
	@Query(value = "SELECT * FROM FLIGHT WHERE  airline_id is  null",nativeQuery = true)
	public Collection<Flight> getFlightInAirline(@Param("dep")String de);
	
	@Query(value = "SELECT * FROM FLIGHT WHERE  airline_id=:dep",nativeQuery = true)
	public Collection<Flight> getFlightForAirline(@Param("dep")String de);
	
}
