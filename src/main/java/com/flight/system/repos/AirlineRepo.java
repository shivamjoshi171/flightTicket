package com.flight.system.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.flight.system.model.Airline;
@Repository
public interface AirlineRepo extends JpaRepository<Airline, String>{

}
