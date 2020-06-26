package com.flight.system.services;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.flight.system.model.BookingDetails;
import com.flight.system.model.Flight;
import com.flight.system.model.PassengerDetails;
import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
@Service
public class PdfGenerator {
	
	
	
	public void genPdf(Flight flight,BookingDetails details, ArrayList<PassengerDetails> list,int price ) throws FileNotFoundException, IOException {
		File target = new File("./src/main/webapp/ticket.pdf");
		PdfWriter writer = new PdfWriter(target);
		String para1 = "Flight Ticket Details";
		PdfDocument document = new PdfDocument(writer);
		File im= new File("./src/main/webapp/WEB-INF/resources/img/1.jpg");
		ImageData data=  ImageDataFactory.create(im.getAbsolutePath());
		Image image= new Image(data);
		Paragraph p1 = new Paragraph(para1);
		p1.setBold();
		p1.setFontSize(40);
		  float [] pointColumnWidths = {150F, 150F, 150F,150F,150F,150F};   
	      Table table = new Table(pointColumnWidths); 
	      table.addCell(new Cell().add(new Paragraph("Airline Name")));
	      table.addCell(new Cell().add(new Paragraph("Departure City")));
	      table.addCell(new Cell().add(new Paragraph("Arival City")));
	      table.addCell(new Cell().add(new Paragraph("Departure Time")));
	      table.addCell(new Cell().add(new Paragraph("Arival Time")));
	      table.addCell(new Cell().add(new Paragraph("Travel Date")));

	      table.addCell(new Cell().add(new Paragraph(flight.getAirlineId().getAirlineName())));
	      table.addCell(new Cell().add(new Paragraph(flight.getDepartureCity().getCityName())));
	      table.addCell(new Cell().add(new Paragraph(flight.getArivalCity().getCityName())));
	      table.addCell(new Cell().add(new Paragraph(flight.getDepartureTime())));
	      table.addCell(new Cell().add(new Paragraph(flight.getArrivalTime())));
	      table.addCell(new Cell().add(new Paragraph(details.getBookingDate())));
	      
	      String p2="Travller Details";
	  		Paragraph p = new Paragraph(p2);
	  		p.setBold();
	  		p.setFontSize(30);
	  	  float [] pointColumnWidths2 = {150F, 150F};  
	  		Table table2= new Table(pointColumnWidths2);
	  		table2.addCell(new Cell().add(new Paragraph("First Name")));
	  		table2.addCell(new Cell().add(new Paragraph("Last Name")));
	  		
	  		for(PassengerDetails details2: list) {
	  			table2.addCell(new Cell().add(new Paragraph(details2.getFirstName())));
		  		table2.addCell(new Cell().add(new Paragraph(details2.getLastName())));
	  		}
	  		String tot= "Total Amount:    "+ price;
	  		Paragraph paragraph= new Paragraph(tot);
	  		paragraph.setFontSize(20);
		Document doc = new Document(document);
		doc.add(image);
		doc.add(p1);
		doc.add(table);
		doc.add(p);
		doc.add(table2);
		doc.add(paragraph);
		doc.close();
	
	}

}
