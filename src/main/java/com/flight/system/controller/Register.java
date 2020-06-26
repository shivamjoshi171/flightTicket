package com.flight.system.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.flight.system.model.Airline;
import com.flight.system.model.BookingDetails;
import com.flight.system.model.Cities;
import com.flight.system.model.Flight;
import com.flight.system.model.PassengerDetails;
import com.flight.system.model.User;
import com.flight.system.repos.AirlineRepo;
import com.flight.system.repos.BookingDetailsRepo;
import com.flight.system.repos.CitiesRepo;
import com.flight.system.repos.FlightRepo;
import com.flight.system.repos.PassengerDetailsRepo;
import com.flight.system.repos.UserRepo;
import com.flight.system.services.PdfGenerator;

@Controller
public class Register {

	boolean admin;
	@Autowired
	CitiesRepo citiRepo;

	@Autowired
	FlightRepo flightRepo;

	@Autowired
	UserRepo userRepo;

	@Autowired
	PassengerDetailsRepo passRepo;

	@Autowired
	BookingDetailsRepo bookingRepo;

	@Autowired
	AirlineRepo airlineRepo;

	@Autowired
	PdfGenerator genPdf;

	@GetMapping("/home")
	public String registerNewUser(ModelMap map, HttpServletRequest request) {
		
		ArrayList<String> cities = (ArrayList<String>) citiRepo.getAllCityCode();
		if (request.getSession().getAttribute("userEmail") == null) {
			request.getSession().setAttribute("userEmail", "no");
		}
		map.addAttribute("citylist", cities);
		return "home";
	}

	@PostMapping("/login")
	public String checkAndLogin(HttpServletRequest request ,ModelMap map) {
		if (request.getParameter("loginType").equals("User")) {
			admin = false;
			request.getSession().setAttribute("admin", 1);
			if (userRepo.userExist(request.getParameter("emailId"), request.getParameter("password")) >= 1) {
				request.getSession().setAttribute("userEmail", request.getParameter("emailId"));
				request.getSession().setAttribute("userName",
						userRepo.findUserByEmail(request.getParameter("emailId")).getFirstName());
				request.getSession().setAttribute("error", 0);
				return "redirect:/home";
			} else {
				map.addAttribute("error", 1);
				return "/home";
			}

		} else {
			admin = true;
			request.getSession().setAttribute("admin", 0);
			if (userRepo.userExist(request.getParameter("emailId"), request.getParameter("password")) >= 1) {
				request.getSession().setAttribute("userEmail", request.getParameter("emailId"));
				request.getSession().setAttribute("userName",
						userRepo.findUserByEmail(request.getParameter("emailId")).getFirstName());
				request.getSession().setAttribute("error", 0);
				return "redirect:/dashboard";
			} else {
				map.addAttribute("error", 1);
				return "/home";
			}

		}

	}

	@GetMapping("/register")
	public String registration(User user, ModelMap map) {
		map.addAttribute("userAlready", 0);
		return "register";
	}

	@GetMapping("/userProfile")
	public String userProfile(ModelMap map, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("userEmail");
		if (email.equals("no")) {
			return "redirect:/home";
		} else {
			User user = userRepo.findUserByEmail(email);
			map.addAttribute("user", user);
			return "UserProFile";
		}

	}

	@GetMapping("/updateInfo")
	public String updateInfo() {

		return "updateInfo";
	}

	@PostMapping("/updateData")
	public String updateData(HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("userEmail");
		User user = userRepo.findUserByEmail(email);
		if (!user.getFirstName().equals(request.getAttribute("firstName")))
			request.getSession().setAttribute("userName", request.getParameter("firstName"));
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setMobileNumber(request.getParameter("mobileNumber"));
		if (!user.getEmailId().equals(request.getParameter("emailId")))
			request.getSession().setAttribute("userEmail", request.getParameter("emailId"));
		user.setEmailId(request.getParameter("emailId"));
		userRepo.save(user);
		return "redirect:/userProfile";
	}

	@PostMapping("/changePassword")
	public String changePass(HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("userEmail");
		User user = userRepo.findUserByEmail(email);
		user.setPassword(request.getParameter("password"));
		userRepo.save(user);
		return "redirect:/userProfile";
	}

	@PostMapping("/submitData")
	public String submitUserData(User user, HttpServletRequest request, ModelMap map) {
		map.addAttribute("userAlready", 0);

		if (userRepo.userCount(user.getEmailId()) >= 1) {
			map.addAttribute("userAlready", 1);
			return "/register";
		}

		request.getSession().setAttribute("userLogin", false);
		userRepo.save(user);
		return "redirect:/home";
	}

	@PostMapping("/result")
	public String flights(HttpServletRequest request, ModelMap map) {
		String departure = request.getParameter("departure");
		String arrival = request.getParameter("arival");
		ArrayList<Flight> data = (ArrayList<Flight>) flightRepo.getAllFlight(departure, arrival);
		if (data.size() >= 1) {
			map.addAttribute("notfound", 0);
			map.addAttribute("allFlights", data);
			request.getSession().setAttribute("travelDate", request.getParameter("travelDate"));
			request.getSession().setAttribute("seatType", request.getParameter("seatType"));
			request.getSession().setAttribute("numberAdult", request.getParameter("numberOfAdult"));
			request.getSession().setAttribute("numberChild", request.getParameter("numberOfChild"));
			request.getSession().setAttribute("numberInfant", request.getParameter("numberOfInfant"));
			System.out.println(request.getParameter("numberOfInfant"));
			return "result";
		} else {
			System.out.println("--------------------------------");
			map.addAttribute("notfound", 1);
			return "result";
		}
	}

	@GetMapping("bookTicket/{flightId}")
	public String bookTicket(@PathVariable String flightId, ModelMap map, HttpServletRequest request) {
		if (request.getSession().getAttribute("userEmail").equals("no")) {
			return "redirect:/register";
		} else {

			Optional<Flight> flight = flightRepo.findById(flightId);
			Flight temp = flight.get();
			map.addAttribute("flightDetail", temp);
			map.addAttribute("numberAdult", request.getSession().getAttribute("numberAdult"));
			map.addAttribute("numberChild", request.getSession().getAttribute("numberChild"));
			map.addAttribute("numberInfant", request.getSession().getAttribute("numberInfant"));
			int totalPrice = 0;
			if (Integer.parseInt((String) request.getSession().getAttribute("numberAdult")) >= 1) {
				totalPrice += Integer.parseInt(temp.getSingleTicketPrice())
						* Integer.parseInt((String) request.getSession().getAttribute("numberAdult"));
			}
			if (Integer.parseInt((String) request.getSession().getAttribute("numberAdult")) >= 1) {
				totalPrice += Integer.parseInt(temp.getSingleTicketPrice())
						* Integer.parseInt((String) request.getSession().getAttribute("numberChild"));
			}
			if (Integer.parseInt((String) request.getSession().getAttribute("numberAdult")) >= 1) {
				totalPrice += Integer.parseInt(temp.getSingleTicketPrice())
						* Integer.parseInt((String) request.getSession().getAttribute("numberInfant"));
			}

			String seatType = (String) request.getSession().getAttribute("seatType");
			if (seatType.equals("PremimumEconomy")) {
				totalPrice *= 1.10;
			} else if (seatType.equals("Bussines")) {
				totalPrice *= 1.25;
			}
			map.addAttribute("totalPrice", totalPrice);
			request.getSession().setAttribute("totalPrice", totalPrice);
			request.getSession().setAttribute("flightId", flightId);
			return "bookTicket";
		}
	}

	@GetMapping("/updateFlightDetails/{flightId}")
	public String updateFlightDetails(@PathVariable String flightId, ModelMap map) {
		Optional<Flight> flight = flightRepo.findById(flightId);
		map.addAttribute("flightDetail", flight.get());
		return "updateFlight";
	}

	@GetMapping("/cancelBooking/{id}")
	public String cancelBooking(@PathVariable String id) {
		if (bookingRepo.count() >= 1) {
			Optional<BookingDetails> details = bookingRepo.findById(id);
			PassengerDetails details2 = passRepo.getDetail(id);
			details.get().setPassengerDetails(new ArrayList<PassengerDetails>());
			bookingRepo.save(details.get());
			passRepo.delete(details2);
			bookingRepo.delete(details.get());
			return "redirect:/pastBooking";
		} else {
			return "redirect:/home";
		}

	}

	@PostMapping("/updateFlight")
	public String updateFlightData(Flight flight, HttpServletRequest request) {
		Cities departureCity = citiRepo.findByCityCode(request.getParameter("depCity"));
		Cities arivalCity = citiRepo.findByCityCode(request.getParameter("arrCity"));
		flight.setDepartureCity(departureCity);
		flight.setArivalCity(arivalCity);
		flightRepo.save(flight);
		return "redirect:/dashboard";
	}

	@GetMapping("/dashboard")
	public String dashboard(ModelMap map) {
		if (admin) {
			map.addAttribute("flightList", flightRepo.findAll());
			map.addAttribute("airline", airlineRepo.findAll());
			return "dashboard";
		} else {
			return "redirect:/home";
		}

	}

	@GetMapping("/viewFlighs/{id}")
	public String das(@PathVariable String id, ModelMap map) {
		if (admin) {
			map.addAttribute("flightList", flightRepo.getFlightForAirline(id));
			return "viewFlights";
		} else {
			return "redirect:/home";
		}

	}

	@GetMapping("/addFilghtToAirline/{aId}")
	String addFlights(@PathVariable String aId, ModelMap map, HttpServletRequest request) {
		map.addAttribute("flightList", flightRepo.getFlightInAirline(aId));
		request.getSession().setAttribute("aId", aId);
		return "addAirlineFlight";
	}

	@PostMapping("/addFlightToAir")
	public String addF(HttpServletRequest request) {
		String a[] = request.getParameterValues("flights");
		Airline airline = airlineRepo.findById((String) request.getSession().getAttribute("aId")).get();
		ArrayList<Flight> list = new ArrayList<>();
		for (int i = 0; i < a.length; i++) {
			list.add(flightRepo.findById(a[i]).get());
			list.get(i).setAirlineId(airline);
			flightRepo.save(list.get(i));
		}
		airline.setFlight(list);
		airlineRepo.save(airline);

		return "redirect:/dashboard";
	}

	@GetMapping("/addNewFlight")
	public String addNewFlight() {
		return "addNewFlight";
	}

	@PostMapping("/payment")
	public String payment(HttpServletRequest request) {

		for (int i = 0; i < Integer.parseInt((String) request.getSession().getAttribute("numberAdult")); i++) {
			String tempF = "AdultF_" + Integer.toString(i + 1);
			String tempL = "AdultL_" + Integer.toString(i + 1);
			request.getSession().setAttribute(tempF, request.getParameter(tempF));
			request.getSession().setAttribute(tempL, request.getParameter(tempL));
		}
		for (int i = 0; i < Integer.parseInt((String) request.getSession().getAttribute("numberChild")); i++) {
			String tempF = "ChildF_" + Integer.toString(i + 1);
			String tempL = "ChildL_" + Integer.toString(i + 1);
			request.getSession().setAttribute(tempF, request.getParameter(tempF));
			request.getSession().setAttribute(tempL, request.getParameter(tempL));
		}
		for (int i = 0; i < Integer.parseInt((String) request.getSession().getAttribute("numberInfant")); i++) {
			String tempF = "InfantF_" + Integer.toString(i + 1);
			String tempL = "InfantL_" + Integer.toString(i + 1);
			request.getSession().setAttribute(tempF, request.getParameter(tempF));
			request.getSession().setAttribute(tempL, request.getParameter(tempL));
		}
		return "redirect:/paymentPage";
	}

	@GetMapping("/paymentPage")
	public String makePayment() {
		return "paymentPage";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().setAttribute("userEmail", "no");
		request.getSession().setAttribute("admin", 1);

		return "redirect:/home";
	}

	@PostMapping("/pay")
	public String pay(HttpServletRequest request, HttpServletResponse response)
			throws FileNotFoundException, IOException {
		Optional<Flight> flight = flightRepo.findById((String) request.getSession().getAttribute("flightId"));
		User user = userRepo.findUserByEmail((String) request.getSession().getAttribute("userEmail"));
		System.out.println(user.getId());
		BookingDetails bookingDetails = new BookingDetails();
		bookingDetails.setFlight(flight.get());
		bookingDetails.setBookingDate((String) request.getSession().getAttribute("travelDate"));
		bookingDetails.setUser(user);
		bookingRepo.save(bookingDetails);
		for (int i = 0; i < Integer.parseInt((String) request.getSession().getAttribute("numberAdult")); i++) {
			String tempF = "AdultF_" + Integer.toString(i + 1);
			String tempL = "AdultL_" + Integer.toString(i + 1);
			String fname = (String) request.getSession().getAttribute(tempF);
			String lname = (String) request.getSession().getAttribute(tempL);
			passRepo.save(new PassengerDetails(bookingDetails, user, fname, lname));
		}
		for (int i = 0; i < Integer.parseInt((String) request.getSession().getAttribute("numberChild")); i++) {
			String tempF = "ChildF_" + Integer.toString(i + 1);
			String tempL = "ChildL_" + Integer.toString(i + 1);
			String fname = (String) request.getSession().getAttribute(tempF);
			String lname = (String) request.getSession().getAttribute(tempL);
			passRepo.save(new PassengerDetails(bookingDetails, user, fname, lname));
		}
		for (int i = 0; i < Integer.parseInt((String) request.getSession().getAttribute("numberInfant")); i++) {
			String tempF = "InfantF_" + Integer.toString(i + 1);
			String tempL = "InfantL_" + Integer.toString(i + 1);
			String fname = (String) request.getSession().getAttribute(tempF);
			String lname = (String) request.getSession().getAttribute(tempL);
			passRepo.save(new PassengerDetails(bookingDetails, user, fname, lname));
		}
		ArrayList<PassengerDetails> list = (ArrayList<PassengerDetails>) passRepo.getTravllerDetail(user.getId(),
				bookingDetails.getBookingId());

		bookingDetails.setPassengerDetails(list);
		bookingRepo.save(bookingDetails);
		int tot = (int) request.getSession().getAttribute("totalPrice");
		genPdf.genPdf(flight.get(), bookingDetails, list, tot);

		String dataDirectory = request.getServletContext().getRealPath("");
		Path file = Paths.get(dataDirectory, "ticket.pdf");
		System.out.println("-----------------------" + dataDirectory);
		if (Files.exists(file)) {
			System.out.println("-----------------------");
			response.setContentType("application/pdf");
			response.addHeader("Content-Disposition", "attachment; filename=ticket.pdf");
			try {
				Files.copy(file, response.getOutputStream());
				response.getOutputStream().flush();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return "redirect:/home";
	}

	@GetMapping("/pastBooking")
	public String viewPastBooking(HttpServletRequest request, ModelMap map) {

		System.out.println("--------------------------------------------");
		User user = userRepo.findUserByEmail((String) request.getSession().getAttribute("userEmail"));

		if (bookingRepo.getCountDetail(user.getId()) >= 1) {
			ArrayList<BookingDetails> list = (ArrayList<BookingDetails>) bookingRepo.getAllDetail(user.getId());
			ArrayList<Flight> list2 = new ArrayList<Flight>();
			for (int i = 0; i < list.size(); i++) {
				list2.add(list.get(i).getFlight());
			}
			map.addAttribute("bookDetail", list);
			map.addAttribute("flight", list2);
			return "pastBooking";
		} else {
			return "redirect:/userProfile";
		}

	}

}
