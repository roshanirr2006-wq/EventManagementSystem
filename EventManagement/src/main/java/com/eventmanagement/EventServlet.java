package com.eventmanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EventServlet")
public class EventServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            deleteEvent(request, response);
        } else if ("edit".equals(action)) {
            editEvent(request, response);
        } else if ("register".equals(action)) {
            showRegistrationForm(request, response);
        } else {
            listEvents(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addEvent(request, response);
        } else if ("update".equals(action)) {
            updateEvent(request, response);
        } else if ("register".equals(action)) {
            registerEvent(request, response);
        }
    }

    private void addEvent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String eventName = request.getParameter("eventName");
        String description = request.getParameter("description");
        String eventDate = request.getParameter("eventDate");
        String venue = request.getParameter("venue");
        String organizer = request.getParameter("organizer");

        String sql = "INSERT INTO EVENTS (EVENT_NAME, DESCRIPTION, EVENT_DATE, VENUE, ORGANIZER) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, eventName);
            ps.setString(2, description);
            ps.setDate(3, Date.valueOf(eventDate));
            ps.setString(4, venue);
            ps.setString(5, organizer);

            ps.executeUpdate();

            response.sendRedirect("EventServlet?action=list");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private void listEvents(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Event> eventList = new ArrayList<>();

        String sql = "SELECT * FROM EVENTS ORDER BY ID";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Event event = new Event();

                event.setId(rs.getInt("ID"));
                event.setEventName(rs.getString("EVENT_NAME"));
                event.setDescription(rs.getString("DESCRIPTION"));
                event.setEventDate(rs.getDate("EVENT_DATE").toString());
                event.setVenue(rs.getString("VENUE"));
                event.setOrganizer(rs.getString("ORGANIZER"));

                eventList.add(event);
            }

            request.setAttribute("eventList", eventList);

            request.getRequestDispatcher("events.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private void deleteEvent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String sql = "DELETE FROM EVENTS WHERE ID = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

            response.sendRedirect("EventServlet?action=list");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private void editEvent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String sql = "SELECT * FROM EVENTS WHERE ID = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Event event = new Event();

                event.setId(rs.getInt("ID"));
                event.setEventName(rs.getString("EVENT_NAME"));
                event.setDescription(rs.getString("DESCRIPTION"));
                event.setEventDate(rs.getDate("EVENT_DATE").toString());
                event.setVenue(rs.getString("VENUE"));
                event.setOrganizer(rs.getString("ORGANIZER"));

                request.setAttribute("event", event);

                request.getRequestDispatcher("editEvent.jsp")
                       .forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private void updateEvent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String eventName = request.getParameter("eventName");
        String description = request.getParameter("description");
        String eventDate = request.getParameter("eventDate");
        String venue = request.getParameter("venue");
        String organizer = request.getParameter("organizer");

        String sql = "UPDATE EVENTS SET EVENT_NAME=?, DESCRIPTION=?, EVENT_DATE=?, "
                   + "VENUE=?, ORGANIZER=? WHERE ID=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, eventName);
            ps.setString(2, description);
            ps.setDate(3, Date.valueOf(eventDate));
            ps.setString(4, venue);
            ps.setString(5, organizer);
            ps.setInt(6, id);

            ps.executeUpdate();

            response.sendRedirect("EventServlet?action=list");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private void showRegistrationForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int eventId = Integer.parseInt(request.getParameter("id"));

        String sql = "SELECT * FROM EVENTS WHERE ID = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, eventId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Event event = new Event();

                event.setId(rs.getInt("ID"));
                event.setEventName(rs.getString("EVENT_NAME"));
                event.setDescription(rs.getString("DESCRIPTION"));
                event.setEventDate(rs.getDate("EVENT_DATE").toString());
                event.setVenue(rs.getString("VENUE"));
                event.setOrganizer(rs.getString("ORGANIZER"));

                request.setAttribute("event", event);

                request.getRequestDispatcher("registerEvent.jsp")
                       .forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private void registerEvent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int eventId = Integer.parseInt(request.getParameter("eventId"));

        String studentName = request.getParameter("studentName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        String sql = "INSERT INTO EVENT_REGISTRATION "
                   + "(EVENT_ID, STUDENT_NAME, EMAIL, PHONE) "
                   + "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, eventId);
            ps.setString(2, studentName);
            ps.setString(3, email);
            ps.setString(4, phone);

            ps.executeUpdate();

            response.setContentType("text/html;charset=UTF-8");

            response.getWriter().println(
                "<html>"
                + "<head>"
                + "<title>Registration Successful</title>"
                + "<style>"
                + "*{box-sizing:border-box;}"
                + "body{margin:0;font-family:Arial,sans-serif;color:#25213b;"
                + "background:radial-gradient(circle at 10% 15%,#ddd6fe 0,transparent 25%),"
                + "radial-gradient(circle at 90% 85%,#fbcfe8 0,transparent 28%),"
                + "linear-gradient(135deg,#f5f3ff,#fdf4ff);"
                + "min-height:100vh;display:flex;align-items:center;justify-content:center;}"
                + ".card{width:500px;max-width:90%;background:rgba(255,255,255,.95);"
                + "padding:45px 35px;border-radius:20px;text-align:center;"
                + "border:1px solid rgba(139,92,246,.15);"
                + "box-shadow:0 20px 50px rgba(76,29,149,.12);}"
                + ".check{width:65px;height:65px;margin:0 auto 20px;"
                + "background:#ede9fe;color:#7c3aed;border-radius:50%;"
                + "display:flex;align-items:center;justify-content:center;"
                + "font-size:30px;font-weight:bold;}"
                + "h2{margin:0 0 12px;color:#2e1065;font-size:27px;}"
                + "p{color:#7b718d;font-size:14px;line-height:1.6;margin-bottom:28px;}"
                + ".button{display:inline-block;padding:12px 22px;"
                + "background:linear-gradient(135deg,#7c3aed,#9333ea);"
                + "color:white;text-decoration:none;border-radius:8px;"
                + "font-size:14px;font-weight:bold;"
                + "box-shadow:0 6px 15px rgba(124,58,237,.22);}"
                + ".button:hover{transform:translateY(-2px);}"
                + "</style>"
                + "</head>"
                + "<body>"
                + "<div class='card'>"
                + "<div class='check'>✓</div>"
                + "<h2>Registration Successful!</h2>"
                + "<p>You have successfully registered for the event.</p>"
                + "<a href='EventServlet?action=list' class='button'>Back to Events</a>"
                + "</div>"
                + "</body>"
                + "</html>"
            );

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}