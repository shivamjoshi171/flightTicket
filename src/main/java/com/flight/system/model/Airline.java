package com.flight.system.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Airline {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String airlineId;
	
	private String airlineName;
	@ManyToMany(targetEntity = Flight.class, cascade = CascadeType.ALL)
	@JoinTable(joinColumns = @JoinColumn(name = "airline_id",referencedColumnName = "airlineId"),
	inverseJoinColumns = @JoinColumn(name = "flight_id",referencedColumnName = "flightId"))
	private List<Flight> flight;
	public String getAirlineId() {
		return airlineId;
	}
	public void setAirlineId(String airlineId) {
		this.airlineId = airlineId;
	}
	public String getAirlineName() {
		return airlineName;
	}
	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}
	

	
}
