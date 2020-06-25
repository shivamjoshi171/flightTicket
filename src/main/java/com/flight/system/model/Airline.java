package com.flight.system.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Airline {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String airlineId;
	private String airlineName;
	@ManyToOne(targetEntity = Flight.class)
	@JoinColumn(name = "flight_id",referencedColumnName = "flightId")
	private Flight flightId;
	public String getAirlineId() {
		return airlineId;
	}
	public void setAirlineId(String airlineId) {
		this.airlineId = airlineId;
	}
	public String getAirlineName() {
		return airlineName;
	}
	public Flight getFlightId() {
		return flightId;
	}
	public void setFlightId(Flight flightId) {
		this.flightId = flightId;
	}
	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}
	

	
}
